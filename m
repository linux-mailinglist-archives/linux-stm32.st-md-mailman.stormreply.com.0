Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DC169FE7
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Feb 2020 09:24:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D7D7C36B0B;
	Mon, 24 Feb 2020 08:24:49 +0000 (UTC)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D422C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Feb 2020 00:08:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 63CCF4970;
 Sun, 23 Feb 2020 19:08:01 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 23 Feb 2020 19:08:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=T6vwYsNt81W4QVG/9yltC3IUmOKJa1U
 I+5Ub1sDqeVo=; b=VnESUfjI+wUMSIT8zSJGjTjnvN1Q6rr2atMpcMbCiiUf2+2
 Htwj6KXEQ+XoQRcjudVhDCcOwskF5C1aPYvls8CtF8hE8ijxhlKEcUWpiHHfBaAZ
 RpBN1jLdSnyFw84+0hMNBkJ0+OEsYJGQuZNZjX5qRvLg1blNdOimuZZwWcwoWWCx
 732ASIGjAnnvLOOg7YHQR1vlBbNzr171taEkuNgFM20PTEYUDefcvNl7ZX15Gs35
 GsdHQ03GOvWx4WvDhTTMdtdU/bjgc4UOt1YDe2sWngY4InuumosjKbGVluxYI2Gk
 DXJAwIJBsbVFjHC2syobhh/mok5s6BA6yGVUKYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T6vwYs
 Nt81W4QVG/9yltC3IUmOKJa1UI+5Ub1sDqeVo=; b=ZNNDRlgevio2rb1a2YaTdE
 Qh34z29wQha3NxZnLqb4sYgCoqWwSVGOaN85Z1tMwRlBFQ3HmBELRcWX1sbS+ZOn
 uca2u05lvw56h0AhBDmYL7GywahUSivkTeGdScJRJ+Df5lqlXNbJ98X7dFa2rHdg
 aPrJdsyIKFJaWcMbMDKBZ4yHnWV0K8q9N4XGuqMx8KOrBRvXlh/jzeAYPZM5vCLg
 H6n/Jxzkrik6LKX4S7HO9BzQddCi3OYYE3U2CyVDQbVN0yRULkmdPGLEBCUzqEPg
 bHZtoDzF5du9tdhPH1ZhcWUnv2VOILcVgZtsBYNKKMsO5m47EgsSWZrvllqtTRLA
 ==
X-ME-Sender: <xms:3xNTXuMK-zhhnncLV5GITMkthKNZCwFHS9K-h156U1hfu4YOnYXcfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeelgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:3xNTXpKC6qAm2Ahf3jxHo-c3o35FJiwIPLiVui0zfDrFEiy9M2fphQ>
 <xmx:3xNTXoJ6X6pRGcZd4emhfEMOflc3Kmf1s7dH19zKHqpXHgcQl_HQ-A>
 <xmx:3xNTXtX3k9pxeGni1WpGnPZwqOfxVh2mLDy8Dda6Ugrn6Keb7aq2nA>
 <xmx:4RNTXotkO9aFVT3yBWk2fO4CBlxxh66eNbaJcXLMJnGGDcoDtR9m6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16150E00A2; Sun, 23 Feb 2020 19:07:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-802-g7a41c81-fmstable-20200203v1
Mime-Version: 1.0
Message-Id: <41551c09-5443-4980-9c6f-6bc7f48aa356@www.fastmail.com>
In-Reply-To: <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org>
 <83c5df4acbbe0fa55a1d58d4c4a435b51cd2a7ad.1582361737.git.mchehab+huawei@kernel.org>
Date: Mon, 24 Feb 2020 10:37:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
 "Linux Doc Mailing List" <linux-doc@vger.kernel.org>
X-Mailman-Approved-At: Mon, 24 Feb 2020 08:24:47 +0000
Cc: Stuart Yoder <stuyoder@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, Amit Kucheria <amit.kucheria@verdurent.com>,
 linux-aspeed@lists.ozlabs.org, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Joel Stanley <joel@jms.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>, Zhang Rui <rui.zhang@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
 Andy Gross <agross@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [Linux-stm32]
 =?utf-8?q?=5BPATCH_2/7=5D_docs=3A_dt=3A_fix_several?=
 =?utf-8?q?_broken_references_due_to_renames?=
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



On Sat, 22 Feb 2020, at 19:30, Mauro Carvalho Chehab wrote:
> Several DT references got broken due to txt->yaml conversion.
> 
> Those are auto-fixed by running:
> 
> 	scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
...
>  .../bindings/pinctrl/aspeed,ast2400-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2500-pinctrl.yaml          | 2 +-
>  .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml          | 2 +-

Acked-by: Andrew Jeffery <andrew@aj.id.au>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
