Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B5192948C3B
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2024 11:38:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6875DC7129D;
	Tue,  6 Aug 2024 09:38:28 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDB54C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 09:38:21 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2f183f4fa63so5851721fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Aug 2024 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722937101; x=1723541901;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DJhPkSNhDdfLFx2gYQV1ujLSQnU42/h3Hyy/L0QOLPU=;
 b=hH2joO7105l3q04yImoS7o54T3GOGS5d7T4nU9/+ucsm7gPOsBsqt7OE7K4XHG6Zpj
 tTT/B2feTlHJ+wbVnk1G9h+V98eJNnXTkdiTqevZZJ7o5EC77nqefHeKqA2MAHhJe5kt
 OL5DP8pBC+/0kL8nYpRIE5OaC6WOCKLEsldP9jNo4z8dy1Pqcfe0Xz5CgE+3nJ8WNQUW
 bAwYXcmSGRuxsOji8vlNfroF7MsaP+ywdevJleQ1uIXRjKBtmeAk2HTPhfz4xudUxEzW
 IWw9QqfzX/4rkWs324spiDfsR/Gvw8dAs9p5ceCfAbcwMRPohD2+Ap35PBeV0H5dVkxK
 FtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722937101; x=1723541901;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DJhPkSNhDdfLFx2gYQV1ujLSQnU42/h3Hyy/L0QOLPU=;
 b=fQFhoCaKot49JjFYKDTysD4+pBI7SHPeMzpeqViofRD16F/7FHxiPZ/VEabw80g28v
 g9+GtoWSJs/hOY2UM9aDrMJorrATMsXE4dELygFNuhPJaHimgUPYa8Y/LJZzsori0TnM
 yk1232z7HF5kdB9JdbSDii0JfNlJz4urcm8+Fe3F4JUXRagG+hSl8Z4EQ9g0F2zcs3Tn
 +DolB/AV82lnnBjid4moeV66iGh/WI+h33rlHNXIeElTy+boNJhqs5vId4GA/60nHPgq
 6StL/NQIFfaS4flS6TYg44IWAt7bj7MtNCdVO5sIQXwNQLtzrC1xxLI40WR8su4B5lDW
 tz/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5EjmvB5CC0bd30HzIHZT6oHH7bA3czb9MeVu5hXhY4EeIr9gj0zWcwTMyAE+p6xRCP/c9Suj+fchfW0LTtFYUbkuoJPAqOGFRsk/ZUKtl+xP0idnyoaWc
X-Gm-Message-State: AOJu0YxA1sCvyeRQQ9m2ThGY2WB6PWe/ym90rdPG9b3FshdtvEwfnZKP
 HMf8qfjsDYfh3VpdSjhb25NSYHEkjpfCqJKH7fLFlYXp2CO6f09F
X-Google-Smtp-Source: AGHT+IFR0d9IbwmBLkFeFJ77ILOonBUYi8sHr7IcC+G13t/ZZueEUcGtc9YhZIfAx/55SH5oSzfzsw==
X-Received: by 2002:a2e:bc23:0:b0:2ef:2b70:5372 with SMTP id
 38308e7fff4ca-2f157662670mr54682171fa.12.1722937100530; 
 Tue, 06 Aug 2024 02:38:20 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e272eeesm14033861fa.128.2024.08.06.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 02:38:20 -0700 (PDT)
Date: Tue, 6 Aug 2024 12:38:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <mn4c5yw3eodduysjaxvt5qpsfm55auumin3jabmu6zymeskdsb@7hvc4qrw6gsn>
References: <AM9PR04MB850628457377A486554D718AE2BD2@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <8aa45bc5-b819-4979-80b5-6d90a772b117@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8aa45bc5-b819-4979-80b5-6d90a772b117@lunn.ch>
Cc: dl-S32 <S32@nxp.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/6] net: driver: stmmac: extend CSR calc
	support
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

Hi Andrew

On Mon, Aug 05, 2024 at 01:11:16AM +0200, Andrew Lunn wrote:
> >  #define	STMMAC_CSR_20_35M	0x2	/* MDC = clk_scr_i/16 */
> >  #define	STMMAC_CSR_35_60M	0x3	/* MDC = clk_scr_i/26 */
> >  #define	STMMAC_CSR_150_250M	0x4	/* MDC = clk_scr_i/102 */
> > -#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/122 */
> > +#define	STMMAC_CSR_250_300M	0x5	/* MDC = clk_scr_i/124 */
> 
> That should probably be called out in the commit message. It is not a
> fix as such, since it is just a comment, but as a reviewer i had a
> double take when i noticed this.,

Yes, this seems like a typo. I've checked the divider semantic in the DW
GMAC 3.50a/3.73a and DW QoS Eth 5.10a HW databooks. Both of them expect the
clk_scr_i ref clock being divided by 124. So the 122 value was
incorrect.

-Serge(y)

> 
> 
>     Andrew
> 
> ---
> pw-bot: cr
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
