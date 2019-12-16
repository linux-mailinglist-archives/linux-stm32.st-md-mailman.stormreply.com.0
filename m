Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C949121ACE
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Dec 2019 21:21:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEBB1C36B0B;
	Mon, 16 Dec 2019 20:21:18 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17D07C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 20:21:17 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k8so8228937ljh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Dec 2019 12:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=Coj/0TiMCvz30A/R8txuCVhc5n1pm41RNaOjJUWUaS0=;
 b=fPZkCIk0sJHFLthoSa2l0yCn2V8lLSwii17NEqkwT98ikRbJYd1twQVIIGQw7ltrH6
 J6doHz2eDuvnDERtdF9jYiFBsZs/SpGZwOcVAugBoU9E3jT41G/1ZigNahbIa1J8rg5K
 kSbJqo+ITbb2zxFaZluYltZ1isGPfKYAAXcte6U5wo82/wR2RXiPcnHGvaAKqPXV0Dnk
 NKG2rqg84KUceg2vu6AL70Z+Ieyhw9hnEIQ5ol8TGm1ChMs4pc0/vpjrVAQGMVZuPzes
 sXe0f9brx+3rHfDB2mBiVtY6XH6BhzvHiPtE68xp98dm6LygxTRY0c3DDKJPoAoGnVLW
 xjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=Coj/0TiMCvz30A/R8txuCVhc5n1pm41RNaOjJUWUaS0=;
 b=HltMPUI1bwoCmkT1/eMfOzYAnzlwMfdr51gXkwcbKcX0+FScIXzNyOLFSPJUu1rVMJ
 fI7gi1JruKhTC0Hi/bygDmXNe+CJynLmSe6sU7XnpdFRqmAZNMat2OaGcJO63aur8h+u
 RnoZpXZS/ZLy/YnCfnps8Di2XAuYoY08kH7m5bRMVkWuGOHK28j5KrZNNpsBxx6Tw6cG
 0wjL/MC+YXODeGmc/XvuCOEMmkW0X9MsBRTZMrppy77SYNe8BuIj4KbatZ3PugMqo12l
 d5aPRbJ1oBiE6vxeTIPDRKgr1jqnOBs2S2+HdKC0dDlA7Eeada/fSESHnAHjWZdNIS/L
 t2ig==
X-Gm-Message-State: APjAAAWg/q+E1x62i5yVWt3vzHzJSlr2Rd/Q8AQE7CvN/Vi5wYqriVxf
 L4zP8uHzmNaeKZM13NmflkM3cg==
X-Google-Smtp-Source: APXvYqwvffi+Q+fIIrfBgnRjuyf8h/Vz0+Y6j1dBgFciwrLYs7AYC/zjAUfMezy6GLiXnMwUcjT2XQ==
X-Received: by 2002:a05:651c:c4:: with SMTP id 4mr644180ljr.131.1576527676330; 
 Mon, 16 Dec 2019 12:21:16 -0800 (PST)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id r26sm9508344lfm.82.2019.12.16.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 12:21:16 -0800 (PST)
Date: Mon, 16 Dec 2019 12:21:06 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20191216122106.582b6cc9@cakuba.netronome.com>
In-Reply-To: <BN8PR12MB326639325F465266DEACAA64D3510@BN8PR12MB3266.namprd12.prod.outlook.com>
References: <cover.1576005975.git.Jose.Abreu@synopsys.com>
 <20191213162216.2dc8a108@cakuba.netronome.com>
 <BN8PR12MB326639325F465266DEACAA64D3510@BN8PR12MB3266.namprd12.prod.outlook.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, 16 Dec 2019 09:26:22 +0000, Jose Abreu wrote:
> From: Jakub Kicinski <jakub.kicinski@netronome.com>
> Date: Dec/14/2019, 00:22:16 (UTC+00:00)
> 
> > On Tue, 10 Dec 2019 20:33:52 +0100, Jose Abreu wrote:  
> > > Fixes for stmmac.
> > > 
> > > 1) Fixes the filtering selftests (again) for cases when the number of multicast
> > > filters are not enough.
> > > 
> > > 2) Fixes SPH feature for MTU > default.
> > > 
> > > 3) Fixes the behavior of accepting invalid MTU values.
> > > 
> > > 4) Fixes FCS stripping for multi-descriptor packets.
> > > 
> > > 5) Fixes the change of RX buffer size in XGMAC.
> > > 
> > > 6) Fixes RX buffer size alignment.
> > > 
> > > 7) Fixes the 16KB buffer alignment.
> > > 
> > > 8) Fixes the enabling of 16KB buffer size feature.  
> > 
> > Hi Jose!
> > 
> > Patches directed at net should have a Fixes tag identifying the commit
> > which introduced the problem. The commit messages should also describe
> > user-visible outcomes of the bugs. Without those two its hard to judge
> > which patches are important for stable backports.
> > 
> > Could you please repost with appropriate Fixes tags?  
> 
> I agree with you Jakub but although these are bugs they are either for 
> recently introduced features (such as SPH and selftests), or for 
> features that are not commonly used. I can dig into the GIT history and 
> provide fixes tag for them all or I can always provide a backport fix if 
> any user requires so. Can you please comment on which one you prefer ?

I think Fixes tags helps either way, if the fix is not important enough
upstream maintainers should be able to figure that out based on the
commit message (or you can give advice on backporting below the ---
line, like "Probably not worth backporting").

For the recent features it's quite useful to see the fixes tag so both
humans and bots can immediately see its a recent feature and we don't
have to worry about backports.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
