Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D604811EF17
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Dec 2019 01:22:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99E0CC36B0B;
	Sat, 14 Dec 2019 00:22:26 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98C96C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Dec 2019 00:22:25 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id e28so540812ljo.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 16:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=giiBxdvWgaNqH68xnv3JmWP9dzCBTdZ9klmH0YITisE=;
 b=moDlCKvuxDXDzEEAIiXkhQpF42yemoKEbL0AZF9wNsfDWxNqQ6PAyC79TcuJE7Mkc9
 Zd8qEd4kDdalk1yWC0H+Rr1MJ1/Yx0Hzhn7Tx0fCPyejRdP0cH3t3Jq5V7nYVWtI9cTR
 S7EOX9jtd1eh7m3Y6RLy5trfH8sioerQknIUhEUlEwtfb3Rtt9vMYdIm0xtLws8vyLIo
 8Wz5AZza9+t2BnITvbK6kvG+AWHbDFu93SVokmMiCVY0e3lv9bI1cVEarTCu+TarLpw3
 brGJ7zEjLhMXpGfaQjutJUx6HNe/0vR1nl/rzpmdY6cIp+tWFtL5Bbuhd7ElwsD/eF6b
 WE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=giiBxdvWgaNqH68xnv3JmWP9dzCBTdZ9klmH0YITisE=;
 b=NM4BKRRk36/n4ruBKAUipGuhlJR3A0G09RMZEhQPH1YloIXFXVon7y3rQLzZFjQRng
 vlBuHkZFXKHxhsRkxkU4yLKDZw3Cry7AZp05TKQ04KFNGWswxA2KEarmRdKCrcajeAsL
 9KGod3e7fOs8GK+5mYc7nPl/toy4W8ngP8IRvgAopWLavfehyK01oc+FaieuKbbZlPVF
 1PLCkH2TzGYJU3jCu3LDX4e4oma2jETSA9vSrl/ExH996f74i1+LgVGDtKQqlyXUJ2oo
 qlRhCsl6tnKGST8R/+d/L/JvPTGqIRvdC0PFuUGQWq+8HR8G2jzbVdDyuZY068hixW0g
 vY7A==
X-Gm-Message-State: APjAAAWSEzwTeh4xDJFf8dM0Ce9h6AuI8kCpSpnFHLHXOFn5Vo03sS5S
 /s0pbZIILwYXSrMkCRXK4ISHTQ==
X-Google-Smtp-Source: APXvYqxk4KifralwNEGO507iNNuOIWFqTEHw/xBJIq1aHCZdSobUATGCeEfnlG0VPQmTb1fbDwOe/Q==
X-Received: by 2002:a2e:9a11:: with SMTP id o17mr11430388lji.256.1576282944630; 
 Fri, 13 Dec 2019 16:22:24 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id k25sm5583547lji.42.2019.12.13.16.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 16:22:24 -0800 (PST)
Date: Fri, 13 Dec 2019 16:22:16 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191213162216.2dc8a108@cakuba.netronome.com>
In-Reply-To: <cover.1576005975.git.Jose.Abreu@synopsys.com>
References: <cover.1576005975.git.Jose.Abreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/8] net: stmmac: Fixes for -net
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

On Tue, 10 Dec 2019 20:33:52 +0100, Jose Abreu wrote:
> Fixes for stmmac.
> 
> 1) Fixes the filtering selftests (again) for cases when the number of multicast
> filters are not enough.
> 
> 2) Fixes SPH feature for MTU > default.
> 
> 3) Fixes the behavior of accepting invalid MTU values.
> 
> 4) Fixes FCS stripping for multi-descriptor packets.
> 
> 5) Fixes the change of RX buffer size in XGMAC.
> 
> 6) Fixes RX buffer size alignment.
> 
> 7) Fixes the 16KB buffer alignment.
> 
> 8) Fixes the enabling of 16KB buffer size feature.

Hi Jose!

Patches directed at net should have a Fixes tag identifying the commit
which introduced the problem. The commit messages should also describe
user-visible outcomes of the bugs. Without those two its hard to judge
which patches are important for stable backports.

Could you please repost with appropriate Fixes tags?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
