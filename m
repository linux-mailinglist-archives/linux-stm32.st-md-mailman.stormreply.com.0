Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDF76DD691
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 11:27:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86517C6A611;
	Tue, 11 Apr 2023 09:27:55 +0000 (UTC)
Received: from mail115-118.sinamail.sina.com.cn
 (mail115-118.sinamail.sina.com.cn [218.30.115.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9BAA7C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Apr 2023 18:14:24 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([180.168.184.106])
 by sina.com (172.16.235.25) with ESMTP
 id 6431AEF60000412B; Sat, 9 Apr 2023 02:14:21 +0800 (CST)
X-Sender: rocklouts@sina.com
X-Auth-ID: rocklouts@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=rocklouts@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=rocklouts@sina.com
X-SMAIL-MID: 5571334210230
From: Yan Wang <rocklouts@sina.com>
To: kuba@kernel.org
Date: Sun,  9 Apr 2023 02:13:58 +0800
Message-Id: <20230408181358.23881-1-rocklouts@sina.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230407195730.298867dd@kernel.org>
References: <20230407195730.298867dd@kernel.org>
X-Mailman-Approved-At: Tue, 11 Apr 2023 09:27:54 +0000
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix system hang when setting
	up standalone tag_8021q VLAN for DSA ports
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

Hi,Jakub

So sorry.

My name is Yan Wang, this is my full name.I have sent you the new patch and modified the signature.  
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
