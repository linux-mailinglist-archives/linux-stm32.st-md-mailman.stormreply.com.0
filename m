Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E107B67B618
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jan 2023 16:43:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85BF3C65E4B;
	Wed, 25 Jan 2023 15:43:03 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CB6FC64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jan 2023 00:57:55 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id q125so18408437vsb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 16:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
 :references:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0H8WY8lEZP/2IBAiimbYtBjaU3GZLdwffTlq/x+qDYY=;
 b=TfdieigdjJME1KXfHsCS2d6pYztRQmaJe4PtYy0MENuUNloylkfezo27R/WyZHyFFO
 sRnhNUt6wDKsHMNdpuqQ2DFjhpMvIn3JUnuiWVh58uO1EXvGJeMcHYdh9b6ZFjz7oGZU
 V5exdmgIEUinKbJjZNzp5rm1QvtrxNLI+rZSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
 :references:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0H8WY8lEZP/2IBAiimbYtBjaU3GZLdwffTlq/x+qDYY=;
 b=kgHkhPvfbaBj8aLx2NUFigr7dJXN4xC7fPvfj0kiRTEnsMqywQvHTkglAHL33T+u5J
 7f80OAJ2iUU4mltT3VIdxyVbYI2z4IacFwLbfoHuaD30cHV11kJuXUMg2FbaZOp+pbGZ
 ljpPxYdKxb8Wh/41Q3ZjAoFqhOKP96OxJXtrVhmgbfYOVbliByPoU6dpnyVDDBRRQiOY
 Uq3i/hCaY/5J4IXQMWJscLRgFjqLCaKuzekmP3p+Lfhrh0a1bi+XbZ9ko0pQdZw9uM1x
 3KK3yH6KsPrtr57sZgxSXIpeeDrASesBXwcQD1vxlNpopr6+n3maDHsArRLQUNwP/WLE
 QZQA==
X-Gm-Message-State: AFqh2kqWeGCpbGxtvjminsk8r1ADF3RVUZ/yrJG8JJU4VF2YOzAPz71M
 j3dfMlDCTmo+5A3OQIJGX9f4dIrTFVbItqG/qYBd3g==
X-Google-Smtp-Source: AMrXdXu0WEVAHtkl/7WrGp7gsGmIxeNAjZACQY1znOQilpBjqALn5uFkSCuep3Y6cqMY533KDesP8Mmq99uNyBp2hTA=
X-Received: by 2002:a67:f246:0:b0:3b1:5690:a240 with SMTP id
 y6-20020a67f246000000b003b15690a240mr3921552vsm.68.1674608274113; Tue, 24 Jan
 2023 16:57:54 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGsd40KKMSPSaowQedOCmq8Q0lhhQIBWekOAbfQgXk=
Date: Tue, 24 Jan 2023 16:57:49 -0800
Message-ID: <36840e0caeca5f53eef4fab615fc7976@mail.gmail.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, broonie@kernel.org, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jic23@kernel.org, 
 tudor.ambarus@microchip.com, pratyush@kernel.org, sanju.mehta@amd.com, 
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, kdasu.kdev@gmail.com, 
 f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
 eajames@linux.ibm.com, olteanv@gmail.com, han.xu@nxp.com, 
 john.garry@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 narmstrong@baylibre.com, khilman@baylibre.com, matthias.bgg@gmail.com, 
 haibo.chen@nxp.com, linus.walleij@linaro.org, daniel@zonque.org, 
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org, 
 bjorn.andersson@linaro.org, heiko@sntech.de, krzysztof.kozlowski@linaro.org, 
 andi@etezian.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
 masahisa.kojima@linaro.org, jaswinder.singh@linaro.org, rostedt@goodmis.org, 
 mingo@redhat.com, l.stelmach@samsung.com, davem@davemloft.net, 
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, alex.aring@gmail.com, 
 stefan@datenfreihafen.org, kvalo@kernel.org, thierry.reding@gmail.com, 
 jonathanh@nvidia.com, skomatineni@nvidia.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, j.neuschaefer@gmx.net, vireshk@kernel.org, 
 rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org, 
 gregkh@linuxfoundation.org
X-Mailman-Approved-At: Wed, 25 Jan 2023 15:43:01 +0000
Cc: alexandre.belloni@bootlin.com, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 tali.perry1@gmail.com, ldewangan@nvidia.com, linux-mtd@lists.infradead.org,
 alim.akhtar@samsung.com, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com, git@amd.com,
 linux-samsung-soc@vger.kernel.org, benjaminfair@google.com,
 yogeshgaur.83@gmail.com, openbmc@lists.ozlabs.org,
 linux-staging@lists.linux.dev, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-imx@nxp.com, amitrkcian2002@gmail.com, Michael.Hennerich@analog.com,
 martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org,
 radu_nicolae.pirea@upb.ro, greybus-dev@lists.linaro.org, lars@metafoo.de,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
 avifishman70@gmail.com, venture@google.com, libertas-dev@lists.infradead.org,
 linux-wireless@vger.kernel.org, nicolas.ferre@microchip.com,
 fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, andrew@aj.id.au,
 michael@walle.cc, palmer@dabbelt.com, kernel@pengutronix.de,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com
Subject: Re: [Linux-stm32] [PATCH v2 02/13] spi: Replace all
 spi->chip_select and spi->cs_gpiod references with function call
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
Content-Type: multipart/mixed; boundary="===============5816798534904939765=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============5816798534904939765==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000058bd5f05f30c1f4b"

--00000000000058bd5f05f30c1f4b
Content-Type: text/plain; charset="UTF-8"

On 01/19/2023 10:53 AM, 'Amit Kumar Mahapatra' via
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> diff --git a/drivers/spi/spi-bcm63xx-hsspi.c
> b/drivers/spi/spi-bcm63xx-hsspi.c
> index b871fd810d80..dc179c4677d4 100644
> --- a/drivers/spi/spi-bcm63xx-hsspi.c
> +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> @@ -130,7 +130,7 @@ static void bcm63xx_hsspi_set_cs(struct bcm63xx_hsspi
> *bs, unsigned int cs,
>   static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi *bs,
>   				  struct spi_device *spi, int hz)
>   {
> -	unsigned int profile = spi->chip_select;
> +	unsigned int profile = spi_get_chipselect(spi, 0);
>   	u32 reg;
>
>   	reg = DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
> @@ -157,7 +157,7 @@ static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi
> *bs,
>   static int bcm63xx_hsspi_do_txrx(struct spi_device *spi, struct
> spi_transfer *t)
>   {
>   	struct bcm63xx_hsspi *bs = spi_master_get_devdata(spi->master);
> -	unsigned int chip_select = spi->chip_select;
> +	unsigned int chip_select = spi_get_chipselect(spi, 0);
>   	u16 opcode = 0;
>   	int pending = t->len;
>   	int step_size = HSSPI_BUFFER_LEN;
> @@ -165,7 +165,7 @@ static int bcm63xx_hsspi_do_txrx(struct spi_device
> *spi, struct spi_transfer *t)
>   	u8 *rx = t->rx_buf;
>
>   	bcm63xx_hsspi_set_clk(bs, spi, t->speed_hz);
> -	bcm63xx_hsspi_set_cs(bs, spi->chip_select, true);
> +	bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), true);
>
>   	if (tx && rx)
>   		opcode = HSSPI_OP_READ_WRITE;
> @@ -228,14 +228,14 @@ static int bcm63xx_hsspi_setup(struct spi_device
> *spi)
>   	u32 reg;
>
>   	reg = __raw_readl(bs->regs +
> -			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +			  HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>   	reg &= ~(SIGNAL_CTRL_LAUNCH_RISING | SIGNAL_CTRL_LATCH_RISING);
>   	if (spi->mode & SPI_CPHA)
>   		reg |= SIGNAL_CTRL_LAUNCH_RISING;
>   	else
>   		reg |= SIGNAL_CTRL_LATCH_RISING;
>   	__raw_writel(reg, bs->regs +
> -		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi->chip_select));
> +		     HSSPI_PROFILE_SIGNAL_CTRL_REG(spi_get_chipselect(spi, 0)));
>
>   	mutex_lock(&bs->bus_mutex);
>   	reg = __raw_readl(bs->regs + HSSPI_GLOBAL_CTRL_REG);
> @@ -243,16 +243,16 @@ static int bcm63xx_hsspi_setup(struct spi_device
> *spi)
>   	/* only change actual polarities if there is no transfer */
>   	if ((reg & GLOBAL_CTRL_CS_POLARITY_MASK) == bs->cs_polarity) {
>   		if (spi->mode & SPI_CS_HIGH)
> -			reg |= BIT(spi->chip_select);
> +			reg |= BIT(spi_get_chipselect(spi, 0));
>   		else
> -			reg &= ~BIT(spi->chip_select);
> +			reg &= ~BIT(spi_get_chipselect(spi, 0));
>   		__raw_writel(reg, bs->regs + HSSPI_GLOBAL_CTRL_REG);
>   	}
>
>   	if (spi->mode & SPI_CS_HIGH)
> -		bs->cs_polarity |= BIT(spi->chip_select);
> +		bs->cs_polarity |= BIT(spi_get_chipselect(spi, 0));
>   	else
> -		bs->cs_polarity &= ~BIT(spi->chip_select);
> +		bs->cs_polarity &= ~BIT(spi_get_chipselect(spi, 0));
>
>   	mutex_unlock(&bs->bus_mutex);
>
> @@ -283,7 +283,7 @@ static int bcm63xx_hsspi_transfer_one(struct
> spi_master *master,
>   	 * e. At the end restore the polarities again to their default values.
>   	 */
>
> -	dummy_cs = !spi->chip_select;
> +	dummy_cs = !spi_get_chipselect(spi, 0);
>   	bcm63xx_hsspi_set_cs(bs, dummy_cs, true);
>
>   	list_for_each_entry(t, &msg->transfers, transfer_list) {
> @@ -296,7 +296,7 @@ static int bcm63xx_hsspi_transfer_one(struct
> spi_master *master,
>   		spi_transfer_delay_exec(t);
>
>   		if (t->cs_change)
> -			bcm63xx_hsspi_set_cs(bs, spi->chip_select, false);
> +			bcm63xx_hsspi_set_cs(bs, spi_get_chipselect(spi, 0), false);
>   	}
>
>   	mutex_lock(&bs->bus_mutex);

For bcm63xx-hsspi driver,

Acked-by: William Zhang <william.zhang@broadcom.com>

--00000000000058bd5f05f30c1f4b
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIPV0GPci7PjhkOLQr5YYlwfjp9bZ
8n4Nhqy3DqNgqzROMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDEyNTAwNTc1NFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQCDeRwW7sqpu5MnOyyvjxmJvRUbfI/L5CP1JkPtuA2BZ0WX
P6pe/eXLFP9A//7IMZwRnMYubkHF2KOwoW3nTAZfFZU1MJtjpUcUMyAey4sODSCw78wnDub+b0R4
rbtgWN26AOILOF9V7rUdA5hd4ZZZWrSVlZOxQOnkEnrrXwRMTZ6H4LILkENVRytDPX6WcNSzofVt
bTZisKrK4TQRGwagjsH1XbjDJQy3in8wE53Bemw/woVR/U5dKkgH5bIc7O+yvfRkg3Dze87oKtUn
0jlTOX7lGBKRqMHxDVl2SRBQXJ+ytWpT1WR9l3AFCBIp4QCo4isjywLpWTF5YramMP+j
--00000000000058bd5f05f30c1f4b--

--===============5816798534904939765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============5816798534904939765==--
