Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30BABA04C
	for <lists+linux-stm32@lfdr.de>; Sun, 22 Sep 2019 04:49:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 731F7C35E01;
	Sun, 22 Sep 2019 02:49:52 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48694C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2019 02:49:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 4so4931380pld.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 21 Sep 2019 19:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=anDfSlcsinrIuqUyxfiFcZfqVNlRcVIERATNLsETqQY=;
 b=mfZxy2sq/aDKntUmvOesWWFgM501zlmT0QpE+8Y3+duZ2e9RLwsdz3EzbknN01qRdx
 /DJM6peKzpH1uE3x7/dOQZhRHneaUKMm5+UU6wBBXZopFmaET2zbcMvrcWFEH8Lcy1MV
 mHsKbJt/O4aAQLG8QlJ5NtzYWa8/QCeSzo9oMiCbVvSsyajYnvQd5hWIV29MDQWxeTMf
 6rnN4w9QkstK63hfcmaGs8Ww6Wf4CDRwdH/94iFQ1InHtTPUqSLl55mQ+r8R2G+4rc6m
 JkiB60FFY2ZFOwyHN7wEgkpBNBIkm7jIrh6HhqdgOUG69IsDm6L4nHXV4BDY+YZsIEfS
 +w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=anDfSlcsinrIuqUyxfiFcZfqVNlRcVIERATNLsETqQY=;
 b=X+cA1y/vESIqyQgTuWesMkVVOSwT3a+hS1lQnKAzm3wrQrqFCBJSDK3fe4XmwPaGwd
 HNhZJJ4enOwkmSBll3WzS+PF1cJKKOzvl5/O+fFy7JrDtlqrATL6dxlydmLKWScOgV5e
 VfrMkZBKW96TrY0twQXSyaHDYVVPjvdeEn3cgj+vA0tbsvIKeyztBDwcTxCHVKnToyds
 xN0mp0yR+fSDOgZzpYw4Hpy5wGzXOsT8GQJMbROkK75ETpnHrPw3veK2WqbsJKW0j7Lj
 VFg0ljEMWEIZz92ATsOCqfPWMyvrZMBYmnJeE/3mmXKoQlCA4GmtOyL/VFtZSIJe5sb5
 gabw==
X-Gm-Message-State: APjAAAX72lTf9Sc3FZsrf+XhgLz2ORYBgvVOcY2Szmwf0yfWE0GSPECg
 EzNSjnESF8fo5bu7NLrszw4gkw==
X-Google-Smtp-Source: APXvYqw/mTTWbaH79472SmRNTbJG75f7zpe+KuB92ZzGVL55dDHwbFBp4ZPeMaM6FzznylBAqzVZQg==
X-Received: by 2002:a17:902:d714:: with SMTP id
 w20mr26240046ply.29.1569120589739; 
 Sat, 21 Sep 2019 19:49:49 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id c31sm5709585pgb.24.2019.09.21.19.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 19:49:49 -0700 (PDT)
Date: Sat, 21 Sep 2019 19:49:46 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190921194946.710bb0f1@cakuba.netronome.com>
In-Reply-To: <20190919123416.3070938-1-arnd@arndb.de>
References: <20190919123416.3070938-1-arnd@arndb.de>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [v2] net: stmmac: selftest: avoid large
	stack usage
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

On Thu, 19 Sep 2019 14:33:43 +0200, Arnd Bergmann wrote:
> Putting a struct stmmac_rss object on the stack is a bad idea,
> as it exceeds the warning limit for a stack frame on 32-bit architectures:
> 
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1221:12: error: stack frame size of 1208 bytes in function '__stmmac_test_l3filt' [-Werror,-Wframe-larger-than=]
> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1338:12: error: stack frame size of 1208 bytes in function '__stmmac_test_l4filt' [-Werror,-Wframe-larger-than=]
> 
> As the object is the trivial empty case, change the called function
> to accept a NULL pointer to mean the same thing and remove the
> large variable in the two callers.
> 
> Fixes: 4647e021193d ("net: stmmac: selftests: Add selftest for L3/L4 Filters")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
