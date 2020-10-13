Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA228D669
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Oct 2020 00:26:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A256C3FAD5;
	Tue, 13 Oct 2020 22:26:39 +0000 (UTC)
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
 [209.85.219.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE6B5C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 22:26:37 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id a4so945435ybq.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 15:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V8Y86yjZEr7hEx+QQuIVtC6iyJ509PC55QpleKSFzuU=;
 b=NUtadb55tG54QBVfiUvii9vZs6YmXLmvnR8wzC7u3WRHGN55CFHC9UXU7ID1ABSoIC
 3ZbIZke6GU8g73VKzGI5oUaJdDSW7KGAQuxi3NBzT0dVk4NoKtH7mKWKMu1x/CdQWH5a
 D9yt6HaMPz1m0KrBbEjnVm+etNzNbNticsKRCeG5wJYmpc6JqXQO+5375p+FeleQqxj+
 EmRAO9B413oNTN65PpPNqA2eDoPWWnwRx0zpksjDfCzIsEmBRp/wQx+phNIk2/YjQkS0
 lgBY6/JPZIc22NnLkjozQbpOaYne12vNqDAAmjOFx0hE+O3+S4o9gVfSoPg2wBPKzmqn
 JFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V8Y86yjZEr7hEx+QQuIVtC6iyJ509PC55QpleKSFzuU=;
 b=gNh2occYyRKL2uPCxJ7iGcEEXpY7Hlymg60mF74Ibz4qVtuxh7YPqNxHe2HExaCfxu
 HtoXkxvm1zqyyXIyE7oY+te8cNhWn2l1KarXhCIJh+wDcqo0XUp4CtKRszJgslCdphfI
 TLUltYi4fQDW28v6I6x0JF4mcaYHSx8WiMXBnIhSMDFV+uxlpDDudX/b+nEfa3t6lsnC
 vVMeK7UPw9QOVja4hPd6K52zdciMhfx972BZLYgyMdIma/I1TvARGDBFN+0mlCiNRQv4
 bmuUZ6HujjRuvkW6iLAKRx62hjtmv7Ahj980vlfBbmjLkXH1ECCH7ThToYG6yy+EJzQ5
 3SYw==
X-Gm-Message-State: AOAM532Tk5DBJ7NhbaXkq3LxFuVD1gpJVAYD5NV/0Wt75N2wIR4eP1PH
 MoX/zR24cf6KmwQMKYFAedXasfsrraz9ZpSzwQ0=
X-Google-Smtp-Source: ABdhPJw1LH7yScNRy3HUjMJWsl1p8r8xAPF3YnkJRB5PKMjJcMgcEfZL5CirBAnkPzpfPH1LF4y5ZIJKLO59J7wHOks=
X-Received: by 2002:a25:2a8a:: with SMTP id q132mr3201833ybq.445.1602627996458; 
 Tue, 13 Oct 2020 15:26:36 -0700 (PDT)
MIME-Version: 1.0
References: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
In-Reply-To: <1602514303-22316-1-git-send-email-hugues.fruchet@st.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 Oct 2020 23:26:10 +0100
Message-ID: <CA+V-a8sxrSgHO-Mm6Xc-DMKFmFr7P=XxU9R+0A3J8PbWeJ+0jA@mail.gmail.com>
To: Hugues Fruchet <hugues.fruchet@st.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain Volmat <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-media <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2] media: ov5640: fix support of BT656
	bus mode
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Hugues,

Thank you for catching the polarity bug.

On Mon, Oct 12, 2020 at 3:55 PM Hugues Fruchet <hugues.fruchet@st.com> wrote:
>
> Fix PCLK polarity not being taken into account.
> Add comments about BT656 register control.
> Remove useless ov5640_set_stream_bt656() function.
> Refine comments about MIPI IO register control.
>
> Fixes: 4039b03720f7 ("media: i2c: ov5640: Add support for BT656 mode")
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  drivers/media/i2c/ov5640.c | 77 +++++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index 8d0254d..c0ebf4c 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -1216,20 +1216,6 @@ static int ov5640_set_autogain(struct ov5640_dev *sensor, bool on)
>                               BIT(1), on ? 0 : BIT(1));
>  }
>
> -static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
> -{
> -       int ret;
> -
> -       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> -                              on ? 0x1 : 0x00);
> -       if (ret)
> -               return ret;
> -
> -       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> -                               OV5640_REG_SYS_CTRL0_SW_PWUP :
> -                               OV5640_REG_SYS_CTRL0_SW_PWDN);
> -}
> -
>  static int ov5640_set_stream_dvp(struct ov5640_dev *sensor, bool on)
>  {
>         return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
> @@ -1994,6 +1980,7 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>  static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>  {
>         unsigned int flags = sensor->ep.bus.parallel.flags;
> +       bool bt656 = sensor->ep.bus_type == V4L2_MBUS_BT656;
>         u8 pclk_pol = 0;
>         u8 hsync_pol = 0;
>         u8 vsync_pol = 0;
> @@ -2001,6 +1988,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>
>         if (!on) {
>                 /* Reset settings to their default values. */
> +               ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00, 0x00);
>                 ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>                 ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00, 0x20);
>                 ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01, 0x00);
> @@ -2024,23 +2012,51 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>          * - VSYNC:     active high
>          * - HREF:      active low
>          * - PCLK:      active low
> +        *
> +        * VSYNC & HREF are not configured if BT656 bus mode is selected
>          */
> +
>         /*
> -        * configure parallel port control lines polarity
> +        * BT656 embedded synchronization configuration
>          *
> -        * POLARITY CTRL0
> -        * - [5]:       PCLK polarity (0: active low, 1: active high)
> -        * - [1]:       HREF polarity (0: active low, 1: active high)
> -        * - [0]:       VSYNC polarity (mismatch here between
> -        *              datasheet and hardware, 0 is active high
> -        *              and 1 is active low...)
> +        * CCIR656 CTRL00
> +        * - [7]:       SYNC code selection (0: auto generate sync code,
> +        *              1: sync code from regs 0x4732-0x4735)
> +        * - [6]:       f value in CCIR656 SYNC code when fixed f value
> +        * - [5]:       Fixed f value
> +        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
> +        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
> +        * - [1]:       Clip data disable
> +        * - [0]:       CCIR656 mode enable
> +        *
> +        * Default CCIR656 SAV/EAV mode with default codes
> +        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
> +        * - CCIR656 mode enable
> +        * - auto generation of sync codes
> +        * - blank toggle data 1'h040/1'h200
> +        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
>          */
> -       if (sensor->ep.bus_type == V4L2_MBUS_PARALLEL) {
> +       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
> +                              bt656 ? 0x01 : 0x00);
Did you test bt656 on your platform ? with these changes BT.656 mode
doesn't work anymore on my platform. With the below diff on top of
your patch it works OK. Could you please test the same works on your
platform.

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 49e73ace8685..c5e45bc17bdf 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1977,6 +1977,40 @@ static int ov5640_set_power_mipi(struct
ov5640_dev *sensor, bool on)
        return 0;
 }

+static int ov5640_set_stream_bt656(struct ov5640_dev *sensor, bool on)
+{
+       int ret;
+
+       /*
+        * BT656 embedded synchronization configuration
+        *
+        * CCIR656 CTRL00
+        * - [7]:       SYNC code selection (0: auto generate sync code,
+        *              1: sync code from regs 0x4732-0x4735)
+        * - [6]:       f value in CCIR656 SYNC code when fixed f value
+        * - [5]:       Fixed f value
+        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
+        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
+        * - [1]:       Clip data disable
+        * - [0]:       CCIR656 mode enable
+        *
+        * Default CCIR656 SAV/EAV mode with default codes
+        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
+        * - CCIR656 mode enable
+        * - auto generation of sync codes
+        * - blank toggle data 1'h040/1'h200
+        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
+        */
+       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
+                              on ? 0x1 : 0x00);
+       if (ret)
+               return ret;
+
+       return ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0, on ?
+                               OV5640_REG_SYS_CTRL0_SW_PWUP :
+                               OV5640_REG_SYS_CTRL0_SW_PWDN);
+}
+
 static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
 {
        unsigned int flags = sensor->ep.bus.parallel.flags;
@@ -2014,31 +2048,6 @@ static int ov5640_set_power_dvp(struct
ov5640_dev *sensor, bool on)
         * VSYNC & HREF are not configured if BT656 bus mode is selected
         */

-       /*
-        * BT656 embedded synchronization configuration
-        *
-        * CCIR656 CTRL00
-        * - [7]:       SYNC code selection (0: auto generate sync code,
-        *              1: sync code from regs 0x4732-0x4735)
-        * - [6]:       f value in CCIR656 SYNC code when fixed f value
-        * - [5]:       Fixed f value
-        * - [4:3]:     Blank toggle data options (00: data=1'h040/1'h200,
-        *              01: data from regs 0x4736-0x4738, 10: always keep 0)
-        * - [1]:       Clip data disable
-        * - [0]:       CCIR656 mode enable
-        *
-        * Default CCIR656 SAV/EAV mode with default codes
-        * SAV=0xff000080 & EAV=0xff00009d is enabled here with settings:
-        * - CCIR656 mode enable
-        * - auto generation of sync codes
-        * - blank toggle data 1'h040/1'h200
-        * - clip reserved data (0x00 & 0xff changed to 0x01 & 0xfe)
-        */
-       ret = ov5640_write_reg(sensor, OV5640_REG_CCIR656_CTRL00,
-                              bt656 ? 0x01 : 0x00);
-       if (ret)
-               return ret;
-
        /*
         * configure parallel port control lines polarity
         *
@@ -2935,6 +2944,8 @@ static int ov5640_s_stream(struct v4l2_subdev
*sd, int enable)

                if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
                        ret = ov5640_set_stream_mipi(sensor, enable);
+               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
+                       ret = ov5640_set_stream_bt656(sensor, enable);
                else
                        ret = ov5640_set_stream_dvp(sensor, enable);

Cheers,
Prabhakar

> +       if (ret)
> +               return ret;
> +
> +       if (on) {
> +               /*
> +                * configure parallel port control lines polarity
> +                *
> +                * POLARITY CTRL0
> +                * - [5]:       PCLK polarity (0: active low, 1: active high)
> +                * - [1]:       HREF polarity (0: active low, 1: active high)
> +                * - [0]:       VSYNC polarity (mismatch here between
> +                *              datasheet and hardware, 0 is active high
> +                *              and 1 is active low...)
> +                */
>                 if (flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>                         pclk_pol = 1;
> -               if (flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> +               if (!bt656 && flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>                         hsync_pol = 1;
> -               if (flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> +               if (!bt656 && flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>                         vsync_pol = 1;
>
>                 ret = ov5640_write_reg(sensor, OV5640_REG_POLARITY_CTRL00,
> @@ -2052,12 +2068,12 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>         }
>
>         /*
> -        * powerdown MIPI TX/RX PHY & disable MIPI
> +        * powerdown MIPI TX/RX PHY & enable DVP
>          *
>          * MIPI CONTROL 00
> -        * 4:    PWDN PHY TX
> -        * 3:    PWDN PHY RX
> -        * 2:    MIPI enable
> +        * [4] = 1      : Power down MIPI HS Tx
> +        * [3] = 1      : Power down MIPI LS Rx
> +        * [2] = 0      : DVP enable (MIPI disable)
>          */
>         ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x18);
>         if (ret)
> @@ -2074,8 +2090,7 @@ static int ov5640_set_power_dvp(struct ov5640_dev *sensor, bool on)
>          * - [3:0]:     D[9:6] output enable
>          */
>         ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT_ENABLE01,
> -                              sensor->ep.bus_type == V4L2_MBUS_PARALLEL ?
> -                              0x7f : 0x1f);
> +                              bt656 ? 0x1f : 0x7f);
>         if (ret)
>                 return ret;
>
> @@ -2925,8 +2940,6 @@ static int ov5640_s_stream(struct v4l2_subdev *sd, int enable)
>
>                 if (sensor->ep.bus_type == V4L2_MBUS_CSI2_DPHY)
>                         ret = ov5640_set_stream_mipi(sensor, enable);
> -               else if (sensor->ep.bus_type == V4L2_MBUS_BT656)
> -                       ret = ov5640_set_stream_bt656(sensor, enable);
>                 else
>                         ret = ov5640_set_stream_dvp(sensor, enable);
>
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
