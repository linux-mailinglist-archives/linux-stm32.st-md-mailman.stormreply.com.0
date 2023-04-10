Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E26DD694
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 11:27:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC47BC6B45D;
	Tue, 11 Apr 2023 09:27:55 +0000 (UTC)
Received: from mail114-241.sinamail.sina.com.cn
 (mail114-241.sinamail.sina.com.cn [218.30.114.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0864C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Apr 2023 07:21:07 +0000 (UTC)
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([116.233.90.202])
 by sina.com (172.16.235.24) with ESMTP
 id 6433B8DE00000728; Mon, 10 Apr 2023 15:21:04 +0800 (CST)
X-Sender: rocklouts@sina.com
X-Auth-ID: rocklouts@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=rocklouts@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=rocklouts@sina.com
X-SMAIL-MID: 48353545089131
From: Yan Wang <rocklouts@sina.com>
To: kuba@kernel.org
Date: Mon, 10 Apr 2023 15:20:49 +0800
Message-Id: <20230410072049.17453-1-rocklouts@sina.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230407195730.298867dd@kernel.org>
References: <20230407195730.298867dd@kernel.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpLCA3IEFwciAyMDIzIDE5OjU3OjMwIC0wNzAwIEpha3ViIEtpY2luc2tpIHdyb3RlOgo+
SXMgdGhhdCB5b3VyIGZ1bGwgbmFtZT8gSWYgeW91ciBuYW1lIGlzIG5vdCBpbiB0aGUgTGF0aW4g
YWxwaGFiZXQKPmZlZWwgZnJlZSB0byBwdXQgaXQgaW4gYnJhY2tldHMgYWZ0ZXIgdGhlIExhdGlu
IHZlcnNpb24sIGUuZy46Cj4KPlNpZ25lZC1vZmYtYnk6IEpvaG4gKNGP0LrQtdGB0Ywg0ZbQvCfR
jykgPGpvaG5AYmxhLmFiYz4KVGhhbmtzIGZvciB0aGUgcG9pbnRlci5JJ20gYXdmdWxseSBzb3Jy
eSxteSBmdWxsIG5hbWUgaXMgWWFuIFdhbmcsCkkgaGF2ZSBtb2RpZnkgU2lnbmVkLW9mZi1ieS4K
Pk5hbWUgdGhlIGxhYmVscyBhZnRlciB0aGUgdGFyZ2V0IHBsZWFzZS4KPgo+ZXJyX3BtX3B1dDoK
T0ssIHRoZSBsYWJlbCBmaXhlZCwgSSByZXNlbmQgYSBuZXcgcGF0Y2ggb24gMjAyMzA0MDgxNTU4
MjMuMTI4MzQtMS1yb2NrbG91dHNAc2luYS5jb20uCgpUaGFua3MuCgogCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
