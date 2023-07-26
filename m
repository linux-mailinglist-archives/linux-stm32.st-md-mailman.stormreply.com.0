Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B397635BD
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 13:58:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A83BC6A61A;
	Wed, 26 Jul 2023 11:58:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B68E3C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 11:58:53 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-31757edd9edso3200113f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 04:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690372733; x=1690977533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YJ91wGokauJt4h461pORCO4RNq/KJQrLD2WGJ0qohX4=;
 b=WfOT5xvfNh1iqk7syIg4kmyVDW1YhagEo9TzC/tD06pO4vrsQ4MCLgdQ3qubnkjPos
 0MjcaOIshsAbJ3b0ZyQ4EFafw2UNgqwy/kpns0gZmHSGEmLrgfdQQJKd76IEsKjgxBI9
 eRnQF2mGHQIc32YBZJX8cUx7Y9FLjzE+Zn4+c2OkS6qsoSdvOk1660qLAHshT6VWCoyO
 I0cQx01jwCs2sqioRIsoBWNJHSKxYRH/pwlyN8iIMJOVjAmPkIPG6esoS8row+7hfJ3U
 8Xks2c29yQRAaY6cVudPd/rghlkfdrhQGUCAFcoqnhHhgtF6CaYrUb6i9PJX3RfBTfg5
 rM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690372733; x=1690977533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJ91wGokauJt4h461pORCO4RNq/KJQrLD2WGJ0qohX4=;
 b=Ofarq9HDnTiB1G2LU1bI0tHBc7BSyr6RNzWDa/2Jc0i/kz3h+Y8+tXjOJsjPMmKGaa
 boaNPtmWUdzE2kHD03hY15VpGd+6qUtSlt+I7QPrLY1Ew7QlXSNIQkR82awh3AHKLLIr
 9hLhr1QH7a8KVM0U07XO4xRQO8XopzVzmNoDgK0aCMYfKh6NKAGhTfie2wlHtZumqBw4
 zEXW9UEbJWwTN0aJWTS0uMXnO5jArAXW7nfUpcLRinAm8QtQfM5Ta87hQ0CpK+a+q+9T
 RCR2S7WEvOLp/9r1wEqUGFz+/5FxJY4KrInMgp3hVyyGqm2snITR3nisx/24Dm0dNQkH
 0Xmg==
X-Gm-Message-State: ABy/qLY56csx+ieVjrO5HwRSVsGcMQVvTvRIbqUoy6xIbN650GFZICPh
 cMIhTGj2SZ5yeWNI0cq8O4g=
X-Google-Smtp-Source: APBJJlFBFaQBLrypfkvQRDfRCg0hi3rQU14s0ZY/E4YmE5tBxKcBDLE/uZ5R5xTim3l+zb9eZtCMbg==
X-Received: by 2002:a5d:5707:0:b0:316:f06c:f07 with SMTP id
 a7-20020a5d5707000000b00316f06c0f07mr1132298wrv.64.1690372732766; 
 Wed, 26 Jul 2023 04:58:52 -0700 (PDT)
Received: from skbuf ([188.25.175.105]) by smtp.gmail.com with ESMTPSA id
 m12-20020adff38c000000b003145559a691sm19675103wro.41.2023.07.26.04.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 04:58:52 -0700 (PDT)
Date: Wed, 26 Jul 2023 14:58:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20230726115849.ljzczotegiqlvmi6@skbuf>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93ffd7a5-2479-4726-b26a-aab10ac09d14@lunn.ch>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Frank Li <frank.li@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-imx: pause the TXC
	clock in fixed-link
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

Hi Andrew,

On Wed, Jul 26, 2023 at 10:32:00AM +0200, Andrew Lunn wrote:
> On Tue, Jul 25, 2023 at 02:49:31PM -0500, Shenwei Wang wrote:
> > When using a fixed-link setup, certain devices like the SJA1105 require a
> > small pause in the TXC clock line to enable their internal tunable
> > delay line (TDL).
> 
> The SJA1105 has the problem, so i would expect it to be involved in
> the solution. Otherwise, how is this going to work for other MAC
> drivers?
> 
> Maybe you need to expose a common clock framework clock for the TXC
> clock line, which the SJA1105 can disable/enable? That then makes it
> clear what other MAC drivers need to do.
> 
>       Andrew
> 

The delicate nature of the SJA1105 bug is that as far as I understand,
the switch is not aware of the fact that its RGMII delay line went out
of whack. Its port MII status registers say that they're okay.

Also, if I understand Shenwei's workaround procedure, it deals more with
"prevention" than with "recovery". I'm not sure that (reliable) recovery
is possible. I'm trying to gather more data from NXP colleagues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
