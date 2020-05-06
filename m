Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A51C692E
	for <lists+linux-stm32@lfdr.de>; Wed,  6 May 2020 08:42:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44336C349C5;
	Wed,  6 May 2020 06:42:49 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86254C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2020 06:42:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id l12so348991pgr.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2020 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Liq4U1nmJp+k1QseFVbXa0y7jGlGm2IcoibIba6bIN4=;
 b=QJXMohOTAWtXIbpZubPh2LhaWiMq0ZGIq0L2bnRHMjcmGM/qNb2cfMeJlBM5rLvlte
 T9eOd/OVDHbQWnD9mwKEjWvtsl0lZ3psBAWlOFkDkmKKLNS11BtBtYhlaIKBPxQK0L22
 NNBB5H7yrCzqTh2ZrpSlqlsBFK/9ikpvANfd+ZT86mABSQfaKlAwhE/Brp70ZaXBQSu1
 CN5fL0eDswOdCzd1tjhv87EdSymR4nUIIZ1qI+BnM5d/q/HlHuwL06b4Pg3YYcvELMgB
 DCBxUPHcHkX5kfPsYbD4mqMkAZJ+AQCY+6Szf7RjtpS+S+AR/y81bNKUJvM8e2CJ/ETY
 nuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Liq4U1nmJp+k1QseFVbXa0y7jGlGm2IcoibIba6bIN4=;
 b=sezfVuN2+tzSq7tjPIjs8ShgyGNJ4EOjVR3e0ERO/oqY7TRU2s4gK+WrUPHie9QWtf
 yiF0GRavnoEkrSeiJnf6mg0w0NtB92ZU3GKPGUWUyccz4iYarAb23q9o+WqR7r7nRiQq
 loywiDyeihll69Gq5k+m+ngkRz/oBQ28RMsM4rThI2qlmlGpvwjafeN9nbAjI92GXXDa
 v3LPcq1bMjgLGMS+F0CsxJyspTTnXavN6xt3L/cEpr3+PJ+vmg2KbpWo3qT2u/570WIQ
 8xrwi++/bb8ITy9eBaL0dmixl4I617PGbMy0bZaxsh6LgLkRIM8FEmh+hBuT3qLjLRGw
 hGTA==
X-Gm-Message-State: AGi0PuaPZ3r+i2uqHmE1RjWF5PSGXxT+hx3PnsuvDKRRNpcAXCz7yRAC
 KuUqEgi+Ce7oovXWg6qvxwY=
X-Google-Smtp-Source: APiQypL4f1fBXLMhRTVK8DI+lv01KkC0rfikO3bHWD+7BkH2eVp9KWSsqAGBycmCNOlzG+hbh0ZLcg==
X-Received: by 2002:a63:4503:: with SMTP id s3mr5973180pga.85.1588747366086;
 Tue, 05 May 2020 23:42:46 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id b75sm3793254pjc.23.2020.05.05.23.42.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 May 2020 23:42:45 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mturquette@baylibre.com, sboyd@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, sam@ravnborg.org
Date: Wed,  6 May 2020 14:42:37 +0800
Message-Id: <1588747358-31306-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] (no subject)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


Fix stm32f429's ltdc driver loading hang in ltdc clk enable. set clk_hw to the
wrong offset of clks in stm32f4_rcc_register_pll, should be PLL_SAI
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
