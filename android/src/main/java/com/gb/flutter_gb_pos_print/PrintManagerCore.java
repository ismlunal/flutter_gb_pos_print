package com.gb.flutter_gb_pos_print;

import android.device.PrinterManager;
import android.graphics.Bitmap;

public class PrintManagerCore
{
    public PrinterManager mPrinterManager;

    public void doPrint(int type, Object content) {
        PrinterManager printerManager = this.getPrinterManager();

        int ret = printerManager.getStatus();   //Get printer status
        if (ret == 0) {
            printerManager.setupPage(384, -1);   //Set paper size
            switch (type) {
                case 0:
                    int fontSize = 24;
                    int fontStyle = 0x0000;
                    String fontName = "simsun";
                    int height = 0;
                    String[] texts = ((String) content).split("\n");   //Split print content into multiple lines
                    for (String text : texts) {
                        height += printerManager.drawText(text, 0, height, fontName, fontSize, false, false, 0);   //Printed text
                    }
                    height = 0;
                    break;
                case 1:
                    Bitmap bitmap = (Bitmap) content;
                    if (bitmap != null) {
                        printerManager.drawBitmap(bitmap, 30, 0);  //print pictures
                    }
                    break;
                case 2:
                    for (int i = 0; i < ((Integer) content); i++) {
                        printerManager.paperFeed(20);
                    }
                    break;
                case 3:
                    String qrText = (String)content; 
                    printerManager.drawBarcode(qrText, 140, 10, /**/58, 6, 50, 0);
                    break;
                case 4:
                    String dMatrixText = (String)content; 
                    printerManager.drawBarcode(dMatrixText, 140, 10, /**/71, 8, 50, 0);
                    break;
            }

            ret = printerManager.printPage(0);  //Execution printing
            //printerManager.paperFeed(15);  //paper feed
        }

        /*for (int i = 0; i < 15; i++) {
            printerManager.paperFeed(20);
        }*/
    }

    private PrinterManager getPrinterManager() {
        if (mPrinterManager == null) {
            mPrinterManager = new PrinterManager();
            mPrinterManager.open();
        }
        return mPrinterManager;
    }

}
