Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A5D485CA0
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jan 2022 00:54:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0F97C5F1F6;
	Wed,  5 Jan 2022 23:54:48 +0000 (UTC)
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB718C5C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jan 2022 23:54:47 +0000 (UTC)
Date: Wed, 05 Jan 2022 23:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1641426886;
 bh=08qnopJ/DUHN91WheoJBHHaZdklDDu1TthMMx1Fhljg=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=V2pKlZ/4UcNGlRHolp7at7kYgRaAnJ5tazpFkXjni0jqbgNPuewWZXlYyTLLt/c8B
 zhj9ywkoZl/LhvrRNYEQUBD20+NXTPQR+kwp69uTrvhgbSslG0Rm8LLEl6ARxo1kxd
 LpRwpY3PT2YcDQB+7wOEFlfkwyRdvGhvzac8IxmgKz+Q9vXxHwafCcf6NeuMNeruit
 Mbzu5Ubn+U1fXJO97kP95TExgYJN01odNRLjp48zHSAGBIc+8LdFNKTIF9gU9PDaCt
 e00IqFAlN8qMoXcJ1JhBD3gRw8J4lv+45BSB0AwSSRqSRNvBSVohD78Fmxbf0+S1bl
 Rawl2cx86GEJg==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
In-Reply-To: <20211226112503.31771-3-jose.exposito89@gmail.com>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 ville.syrjala@linux.intel.com, marex@denx.de, linux-imx@nxp.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/6] drm/plane: Fix typo in
	format_mod_supported documentation
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Pushed patches 1 & 2 to drm-misc-next. Thanks for your contribution!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
