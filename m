Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD993CF394E
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 13:42:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989F5C56612;
	Mon,  5 Jan 2026 12:42:43 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDC6CC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 12:42:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so152135955e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 04:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767616962; x=1768221762;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
 b=BtgnPAoy6DMwJtVyGPZmd4E8OgiJQfAO/hu3AVtBW00imddlFxEDr0lYbE1jFFiCAs
 qlYYQTxpxbyeyfw4UEu1/DWgSt5+7yOH3KWmCKNuCupPXvhPXtSqm+MzD3IoCfJwUMdi
 sli4k5qbA9qRbi3e/PSAhKXWjXCoUoCP7I0HDYYjy5bPAxqESCXdGJVpDCLSiL5d1F0E
 s0WjDenlgILCCXBemw+1XUtzaQWNhR3iSt/sMq+aylBsJXdVletEKxEe0rknLyzhOttY
 frOh0jCDEEzq4WYD4BDeF0SpfMnGqyKVa3WJ1UxCxrRcNpCrjSZb28WgqYUBQygjRMOm
 S2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767616962; x=1768221762;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6FWi4UMmKWtBKBjWiuhONQOF6ehNZanQAGIzU2PCLHY=;
 b=aPmh5qRpgD1ajeCCKQBtRNZaHwh+C5ujsoGAJwCaTmxSBuF4Jjd978jOKuqqAiKNfW
 +EugklGWguLK3Md/lqZmSb6Soc11H6Z539z1EEIhgL2blqls+uT8jot/ydgt9h+jDD40
 qjfLkSTmXIjH1EueLkNkl1HFkkjl01jgW2ZNHc4uYRXIsSORX1StJsozfrxFE3CGIXi4
 iSka2s/Pb7GyPVCH3aGPKYCamNbHqeD6hHjyZWLCF7Mcu/oJAzNByA1ZLR+fWSN8dcuw
 g0dwFkJDEu+cFr5Wrglz2pqsLmwMxzgAI43a0tltqGIzarX2i0kdveRqyKDAEMTrvc+1
 rCpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDYYiJECy1ZJm+vPI6Ms8Hfs8sb2Sx/d/ny1un37Mv8HwDavj3FIfg+vRTJfGUunUfLqIAOpq4f/zSVQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwA2M4La7MevlBae3h1yHtp08PZ7KiY0Cq/B8vL+1o7XRXsyPn2
 /AtYtpFKP5f18G+AveTUkY9Uv+YgsO2hk6ikMnBnl2CqtPX3FIslvw8w
X-Gm-Gg: AY/fxX7HYU3135oahNOaSeirlHw4otOz5l6gbI8VHgv1fl+epH6DGKCbXP10Oi/BvfY
 b6kE5SG1l7mF7NFLohCGTXuyOmLlkwIBXz7KfFQCfsMf6aegyU/dHy3lV8odqW4hRpr0HJCyhaJ
 7JafQPonkojHSq5UTibxYswcDNL3cwnMxTMp5QI7vAZzA4+gwCEKdpUGbDFVWkIM2MK1c9sQHxA
 p5fKc4hb+fh8COBm9l69LXU5i+82l6aLlYw6w44JqwJJT2vYREc3iON5ufROPyOloxgVD42QWEm
 sZSj7spQBW+CXHvzgmLVaYhLLO1zK3o+JutoFJTKCOKFH22SFE9WxXS7ZI6zNK8Y2Rqsv6CPssz
 GsQPv9u9rGBBdiKEegIg6s2dPrroLydVGl37tGo+lfALZnqm0IMg/SPvDahVSlJj3yXlrUl6MO1
 /Sb9ys/AVHFwo=
X-Google-Smtp-Source: AGHT+IHtGtvg4uT3cboCMh8iga2sewapNAHrP9JvUocRuk9xAXBp5Q/b/VJsN4JJTeNeQfvMRiCunw==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-47d1955578bmr717393225e9.16.1767616961956; 
 Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:20bb:19ed:fbb2:7e2d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2721sm100277452f8f.39.2026.01.05.04.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 04:42:41 -0800 (PST)
Date: Mon, 5 Jan 2026 13:42:39 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aVuxv3Pox-y5Dzln@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, robh@kernel.org, festevam@gmail.com,
 s.hauer@pengutronix.de, francesco.dolcini@toradex.com,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, kernel@pengutronix.de, netdev@vger.kernel.org,
 kuba@kernel.org, Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 pabeni@redhat.com, shawnguo@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

Hi Maxime,

On Mon, Jan 05, 2026 at 01:23:46PM +0100, Maxime Chevallier wrote:
> Hi Stefan,
> 
> On 05/01/2026 11:02, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > Add a fixup to the stmmac driver to keep the preamble before the SFD
> > (Start Frame Delimiter) on the Micrel KSZ9131 PHY when the driver is
> > used on an NXP i.MX8MP SoC.
> > 
> > This allows to workaround errata ERR050694 of the NXP i.MX8MP that
> > states:
> > ENET_QOS: MAC incorrectly discards the received packets when Preamble
> > Byte does not precede SFD or SMD.
> > 
> > The bit which disables this feature is not documented in the datasheet
> > from Micrel, but has been found by NXP and Micrel following this
> > discussion:
> > https://community.nxp.com/t5/i-MX-Processors/iMX8MP-eqos-not-working-for-10base-t/m-p/2151032
> > 
> > It has been tested on Verdin iMX8MP from Toradex by forcing the PHY to
> > 10MBit. Without bit 2 being set in the remote loopback register, no
> > packets are received. With the bit set, reception works fine.
> > 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> I've also faced this issue, however I'm wondering wether this is the
> correct approach to fix this. It seems that all Micrel / Microchip PHYs
> have this behaviour of discaring the preamble at 10Mbps.
> 
> Some of these phys have accessible control registers to re-enable it,
> however this register/bit changes depending on the PHY model. For
> example, on KSZ8041, this is register 0x14 bit 6.
> 
> We may end-up with many many more fixups for this, basically for every
> micrel/microchip PHY.
> 
> Wouldn't it be safer to just always enable preamble at 10M for these
> PHYs, regardless of the MAC that's connected to it ? Is there any risk
> always having the preamble there ?

This is what Rob also suggested:
https://lore.kernel.org/all/20251215140330.GA2360845-robh@kernel.org/

Unfortunately, I'm afraid of breaking something on the platforms that
are already working, as this is an Ethernet controller issue. As I
understand it, the PHY works according to the standard. Since the bit is
undocumented, it seemed safer to only apply it to the i.MX8MP.

However, if this is preferred, I am also happy to always enable the
preamble. In theory, I don't see any reason why it should break
anything.

Regards,
Stefan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
