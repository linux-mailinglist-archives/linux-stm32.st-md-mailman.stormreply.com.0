Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AD87E46C
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Mar 2024 08:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29DE0C71280;
	Mon, 18 Mar 2024 07:54:23 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFC8EC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Mar 2024 21:34:02 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id
 a640c23a62f3a-a466e53f8c0so409244166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Mar 2024 14:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710624842; x=1711229642;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3K3Xj+4K2+7t2UBVw1YNMS/5uNqg9Yzu7R/sU+HTXQk=;
 b=DPeRjfw91cLcb9Tog1zDf9xoZIo5FKky9A93zWspE+xxaVYFbvsWrBVjbLZ6IU5M9c
 zQnjBs/51mi0FwDzU04ORg0yaTfreSoh/jXVqRwsxBHZmpb9y+PRSg7FPdidNBJs2Vmx
 qyMh5Hh9DTGrT3m/WC03DDqk7LNmttVYXwWE4bb+i6F73l6rpbUGH/xE7b0Y/A+8ULop
 4afmT9UkaIsUB2a1H95o62WWCvMd7q4QFOlIsrzLNzplczw3+CGoRU/oYh1gmDug1hGZ
 4F8wzHbP9j30QqJyJXw/I9K5fJhyzK9k6FAGeLBc4WMxoDlCh3LAyb6G8ecPLiImATAM
 BaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710624842; x=1711229642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3K3Xj+4K2+7t2UBVw1YNMS/5uNqg9Yzu7R/sU+HTXQk=;
 b=cFscK0dN0t9k1z3rOayXV5zx1PWqmm9xmWxYBLx8vjAHEpju3Q7JukqT3nj49a9NXo
 3ldtWXQMV6eTHkOtm1ljvydrK0MB2D2TOTVijryB1eSPzcd0Dd7+yGlJyZwI7s8+I5pD
 UUE9o6X8IYxdXLzkJ5GtTR53zYz+ZKKAaX1CRpioVyJMAhTCsJyRLG9wC8+bllA+U2ng
 XC9sv1kRFKoJ6r7smjv1J2DNaQOQS0w5isZBDCNo86/lqrLeeVVSRmmtZboRcAmn4g2Q
 d8genPzgGQexsqGlzgoB6nqVspF2rSoUncEDhoSEufqLsVQBetwctr0RVw2NiaRDlxjc
 OCSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo62X+9kdLot0H3GS/utokk508CeKIDbWQm9H23JHy1Dl9x8ynUD/TN3CsM2AnmyCCzirRkmyYemA4Cl6EjmmeNve63kU/ipm5+ESl4aCXH+sqEeMU+wcE
X-Gm-Message-State: AOJu0YzsTLNGf+YOElGxnE4j0Tx8SRzZgiaZW6Lop5zcOOpCiRV5IzQe
 NYvHZaWOPE902NAQNndrj1DiB1qx6d6Q9i0nBEz4P1mEh6DyH+j1
X-Google-Smtp-Source: AGHT+IGh6hRlI2QPgnitjywTHfHqxMiHgBs2kiVtdspFsEmU+BIU4SDZtu1WpQjRFIVwATWylvGBoA==
X-Received: by 2002:a17:906:bc8e:b0:a46:6433:2c2 with SMTP id
 lv14-20020a170906bc8e00b00a46643302c2mr5658917ejb.53.1710624842092; 
 Sat, 16 Mar 2024 14:34:02 -0700 (PDT)
Received: from bhlegrsu.conti.de ([2a02:908:2525:6ea0::f845])
 by smtp.gmail.com with ESMTPSA id
 bq8-20020a170906d0c800b00a46550ec5b1sm3115069ejb.32.2024.03.16.14.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Mar 2024 14:34:01 -0700 (PDT)
From: Wadim Mueller <wafgo01@gmail.com>
X-Google-Original-From: Wadim Mueller <wadim.mueller@continental.com>
Date: Sat, 16 Mar 2024 22:34:00 +0100
To: Stephen Boyd <sboyd@kernel.org>
Message-ID: <20240316213400.GA5628@bhlegrsu.conti.de>
References: <20240315222754.22366-1-wafgo01@gmail.com>
 <20240315222754.22366-2-wafgo01@gmail.com>
 <3cd275cb1f53a5fdfbf7028f233f4fd7.sboyd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cd275cb1f53a5fdfbf7028f233f4fd7.sboyd@kernel.org>
X-Mailman-Approved-At: Mon, 18 Mar 2024 07:54:20 +0000
Cc: NXP S32 Linux Team <s32@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Wadim Mueller <wafgo01@gmail.com>,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Johannes Zink <j.zink@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-clk@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Halaney <ahalaney@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 1/3] arm64: dts: S32G3: Introduce device
 tree for S32G-VNP-RDB3
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

On Fri, Mar 15, 2024 at 03:41:14PM -0700, Stephen Boyd wrote:
> Quoting Wadim Mueller (2024-03-15 15:27:47)
> > diff --git a/include/dt-bindings/clock/nxp,s32-scmi-clock.h b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
> > new file mode 100644
> > index 000000000000..240022c1f109
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/nxp,s32-scmi-clock.h
> > @@ -0,0 +1,158 @@
> > +/* SPDX-License-Identifier: BSD-3-Clause */
> > +
> > +#ifndef __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
> > +#define __DT_BINDINGS_NXP_SCMI_CLOCK_S32_H
> > +
> > +#define S32_SCMI_COMPLEX_CLK           0xFFFFFFFFU
> > +#define S32_SCMI_NOT_IMPLEMENTED_CLK   0xFFFFFFFEU
> > +
> > +#define S32_SCMI_CLK_BASE_ID           0U
> > +#define S32_SCMI_CLK(N)                        ((N) + S32_SCMI_CLK_BASE_ID)
> > +#define S32_PLAT_SCMI_CLK(N)           ((N) + S32_SCMI_PLAT_CLK_BASE_ID)
> 
> I think we've been recommending that scmi clk consumers simply list the
> number instead of making up defines for them.
> 

yes, that makes sense. Was not aware that this is the recommendation. I
will get rid of this file completely, and instead hard code the numbers
into the DT. Thanks for the hint.

> > +
> > +#define S32_SCMI_CLK_VERSION_MAJOR     (1)
> > +#define S32_SCMI_CLK_VERSION_MINOR     (0)
> 
> Why is this part of the dt binding?

yes, this is stupid, you are right. Simply missed to delete it! As the
file will be removed, it will be gone on the next spin. Thanks.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
