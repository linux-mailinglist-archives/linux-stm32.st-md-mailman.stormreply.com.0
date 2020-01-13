Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A254F139292
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 14:55:56 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63BA9C36B0E;
	Mon, 13 Jan 2020 13:55:56 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89BCBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 13:19:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so9592986wmj.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 05:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oPpAx4psrCRpvGxa+BiR5YMo0bdqOSs/oqk3OpqA2oE=;
 b=nWfPhbzI4KL3RW27J8sCj9bO4EGHIMFwVLTgYFDFOZ+ANyQXA2pSwjrFy7psj7W+ZP
 MdbRRjRbTVNa6CoYI1BBlpzinR2bYmiLozKhWnRabab4FT4Vx3/5uf9wX9S+Mh7gQ49Y
 UbKNk8qoaO0amqRtlEv712jO3q3egODBlzftQohOvXzHHA9w+447cDVyeZYK7s37SiOI
 EysUDLsiaCsJAeLVOYLgWZN0PRMMjrIpMHhRGoP+GiMlKdbzZXfhqxZRoqNj4Kxyq7ch
 zHzgEoZGyoo52b8uWmEYSsdiQyIw74mbx7/RNV2rlK1EuAjtm+9Ew7qzdTV/5taVURqC
 cEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oPpAx4psrCRpvGxa+BiR5YMo0bdqOSs/oqk3OpqA2oE=;
 b=omFyM8TE5NFD8ERmKwT3ig7cOqHMFvkS2pock8kgfonmG1/BIohGzINOiRKb/jwqf0
 7wIrlSBrIjDfd+j15sN12XkWbYwheXXQzt0bf3su5TyATtMue7LL99exYeyAOtwNrVlL
 Mswzl6JD4VQ5fYwS4GhqoXfRAsYzmIAi4ulYtYf3nzhvu7XYc1t36CSQBTV26c46Lr9W
 DVthKxlpIe5/aBhJaCZrAQnb0o9V/tAMz+VOkNzOAAp7gzzQ+B7/GNMEc7gwz2iyjZuR
 cVKfgXTcwCV53ekYoFMUz2+jfDlQsiV8LMsd3KBfpCugnUAMNmoOrlv6XRVfukW3RWFM
 2yYQ==
X-Gm-Message-State: APjAAAX3Jstur6n+IUkcE4UoR9WJtm0KFO8pdMVqm0UacfIOknOngSTK
 dPqKHlE8ipuRMg5pIHVQVSc=
X-Google-Smtp-Source: APXvYqxn3ntfwmrL/v96gX5s5FIm1RyRW1Potx8vLiHtfqQr7a+LGA0J651zcltIe5UzdBDMZMOa/g==
X-Received: by 2002:a1c:a982:: with SMTP id
 s124mr19609972wme.132.1578921566115; 
 Mon, 13 Jan 2020 05:19:26 -0800 (PST)
Received: from L340.local ([2a02:85f:511:c300:1684:322e:585c:32af])
 by smtp.gmail.com with ESMTPSA id s1sm14200368wmc.23.2020.01.13.05.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 05:19:25 -0800 (PST)
From: "Leonidas P. Papadakos" <papadakospan@gmail.com>
To: patrice.chotard@st.com
Date: Mon, 13 Jan 2020 15:19:20 +0200
Message-Id: <20200113131920.13273-1-papadakospan@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <c1af466d-0870-364f-1bff-0ac015811e60@st.com>
References: <c1af466d-0870-364f-1bff-0ac015811e60@st.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 Jan 2020 13:55:55 +0000
Cc: Jose.Abreu@synopsys.com, jayati.sahu@samsung.com, f.fainelli@gmail.com,
 heiko@sntech.de, rcsekar@samsung.com, netdev@vger.kernel.org,
 sriram.dash@samsung.com, linux-kernel@vger.kernel.org, p.rajanbabu@samsung.com,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 pankaj.dubey@samsung.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: platform: Fix MDIO init for
	platforms without PHY
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

This change affects my Renegade board (rockchip/rk3328-roc-cc.dtb),
(and probably the very similar Rock64) preventing me from using any kernel after
5.4.6 in a meaningful way.

I get the stacktrace mentioned before at boot.

Predictably, a command like 'ip address show' will hang since it probes 
networking but 'sudo' also freezes...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
