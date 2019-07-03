Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B870C5F758
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 13:46:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85717C10CAD
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Jul 2019 11:46:38 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07522CB4A8C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Jul 2019 20:41:19 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h18so3401998qtm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Jul 2019 13:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=7UrgCJh7ynybyKVyA1NdfWdn/54CS6hsmMgsbu19Pro=;
 b=1xNP2ViByzwg7pUQH7ecLseKnc6Kf20ns0UGpDVoStT7GQGvwmwE6SJ0k1iU5yGYP1
 YkAGhrv0HN2QIN8wQn6mXjkbKkeU5iP2vQLDN2W3vBP0GIuM0QWyFHyFz6ZvUz/PtGTu
 LbFashhUsq2OaHMk3U4qMxU16BQ81vhjqjqPqmmr29MJZE1diWeHz5ZEjXmgySm2Zcwl
 vEonLtxm9XIuu8gCqbEbILaGG75AS6iF8/PterCoeKr5wJQYNeLwGrDFJEKOPk6IN3/W
 Do59BlnuM6zXZnfMXtx78p5hoPPsg3DnI2cUOWPuIIvurACVL6MnBqrNQuyXjnrggF21
 sFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=7UrgCJh7ynybyKVyA1NdfWdn/54CS6hsmMgsbu19Pro=;
 b=J5JSX9qgky7NPP48FPxpwQh9CK3OOdBrn6UVNe1jGSyw6sELR/izsHZjAbCAhKnbcX
 VprRmta0xbL8hy3tfTzhbAf5JoqGI65qSDpXY3zi0FBdvti+rVFhoaeunKYReUr9cZsR
 7gu5BwR/HWDKd7m1IgVqbKsD3HnPr3wIfeCFIGAkxO4nae0yUoXIJMOlr9fkDMKUif69
 K631DZN1xk7gkjjl/YP2reUyHhyTUJejHDkgnmXiSlLAoNWlfKq3wAB98iTGx+7ISeFi
 llv3tKCVClGuVzk90n8uqQKnMAdNXi6AL4n4qi3v6OFzZ6eq8D9II+Lqjntc0TcYKamw
 4YUQ==
X-Gm-Message-State: APjAAAVXt26izU0yzLVVqArnZW6pxkQNBZ94qXm3/pvl4GLxzHklgILp
 k0recPfIY+7RgH+CfHZ++wYaTQ==
X-Google-Smtp-Source: APXvYqyNeh/RKaf68L+vXqVqLoLkpZavQ2W3Xnd/iPV5JNOmdb39n5515aLelaTUJXaJbjErhrpkTg==
X-Received: by 2002:aed:2fa7:: with SMTP id m36mr33207887qtd.344.1562186477682; 
 Wed, 03 Jul 2019 13:41:17 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id y20sm1452439qka.14.2019.07.03.13.41.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 13:41:17 -0700 (PDT)
Date: Wed, 3 Jul 2019 13:41:13 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190703134113.0e256b33@cakuba.netronome.com>
In-Reply-To: <003df660052f33891ab74ee79c5f1272b72bde54.1562149883.git.joabreu@synopsys.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <003df660052f33891ab74ee79c5f1272b72bde54.1562149883.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 11:46:36 +0000
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] net: stmmac: Implement RX
 Coalesce Frames setting
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

On Wed,  3 Jul 2019 12:37:48 +0200, Jose Abreu wrote:
> Add support for coalescing RX path by specifying number of frames which
> don't need to have interrupt on completion bit set.
> 
> This is only available when RX Watchdog is enabled.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> Cc: Joao Pinto <jpinto@synopsys.com>
> Cc: David S. Miller <davem@davemloft.net>
> Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Chen-Yu Tsai <wens@csie.org>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
