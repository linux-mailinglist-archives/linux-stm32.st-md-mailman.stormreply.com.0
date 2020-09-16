Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CE226B656
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Sep 2020 02:03:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13EDC3FADF;
	Wed, 16 Sep 2020 00:03:08 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE04DC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Sep 2020 00:03:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bg9so2193098plb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 17:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/9YC3jzxgXrgHNvLV2DgKLu9vRPOEeUndPKkcJPjDSI=;
 b=jf9mDfg00fVj/EphFCM3fHgNMnH5rlkZ88FTfEbdsiXbD3jHObKr2feFEkpxgSqHgM
 w8xtcPHIrz5QxSdbj68FYVkzfR6KXWRiXFiu3RqGA4lkgv8z+iENnMEf5h2UPCdcbY41
 de6Urh5A4PvZ9ztobefpx8bA0PsGBQ4Yl+JMjPiJblHEEsBSq2CLiRzEURv0W5jXdMes
 gDmvm5JB+JRMI1bFPWDQ7Q9TdJ9U7fF2WPm6Z3rCPM+IaPBFqxWMjgBUnkWLclRI8z7O
 Kx40EhJyj6I7q9wINksgDQIIuUz8aXeiSY9riKg+FKD+c1Ul1Cl/u7lwNYnG0uJamBoy
 xagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/9YC3jzxgXrgHNvLV2DgKLu9vRPOEeUndPKkcJPjDSI=;
 b=elJK+rSBH8kUuf3TAkRyjLmRlpROnk11WskeFG4dbXNJkYMbiBnmIY0d4vx9aIQ5LR
 GogOo8J0usvY6Tcmiz2fOr75o1b5SZclhgCoB3nuVs/xQUuk0iUS2s/FdiZSll+3hmBq
 qVq8TwAZQnx0XC5YBeh6fOO3YRV/bycE58Gw9F+NJu0XCGZexPRTTUlE7TtBVhU6QSpa
 iH4qObTqv8eqh4xobcSh2SJdt6fPouH9e341JJ0OloBU5B5gy+ONVrfGLveks64u/Icq
 TqX5i7iW2ZHfzREHh3Y/EULIHPazlm2VQQilpx9mBT403EXLBGoIhtqNWp2hO9JctCzn
 8lPw==
X-Gm-Message-State: AOAM5323e6zry6Xwg6LxGmVDSwKvzfjNFJBhlLtTr6cmDWvL0jufhiEO
 KCxSTw1BW5NvXSBuVk5ouYw=
X-Google-Smtp-Source: ABdhPJwXZLREEPePNQ09vlrQA/w6bnVK1+xr2DoofOoKKiFD/yJFWzHp7fSEVmNoHeMMrfNyXMrCgw==
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr1569754pjv.145.1600214584632; 
 Tue, 15 Sep 2020 17:03:04 -0700 (PDT)
Received: from [10.230.28.120] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id o17sm12100848pgb.46.2020.09.15.17.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 17:03:03 -0700 (PDT)
To: "Wong, Vee Khee" <vee.khee.wong@intel.com>,
 David Miller <davem@davemloft.net>
References: <20200915012840.31841-1-vee.khee.wong@intel.com>
 <20200915.154302.373083705277550666.davem@davemloft.net>
 <b945fcc5-e287-73e2-8e37-bd78559944ab@gmail.com>
 <BYAPR11MB287046044CA144193135B0E7AB200@BYAPR11MB2870.namprd11.prod.outlook.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <16a0dc9e-4e08-6d71-6be4-13c2fc8c53dd@gmail.com>
Date: Tue, 15 Sep 2020 17:02:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <BYAPR11MB287046044CA144193135B0E7AB200@BYAPR11MB2870.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "Voon, Weifeng" <weifeng.voon@intel.com>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Seow,
 Chen Yong" <chen.yong.seow@intel.com>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>, "Vijaya Balan,
 Sadhishkhanna" <sadhishkhanna.vijaya.balan@intel.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "Ong,
 Boon Leong" <boon.leong.ong@intel.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: Add ethtool
 support for get|set channels
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 9/15/2020 4:59 PM, Wong, Vee Khee wrote:
> My bad...
> 
> Hi David Miller,

(please don't top post)

> 
> Can you help with the commit message fix or do you want to to send a new patch with the fix since the patches are applied on net-next?

It has already been applied, so this is too late, just telling you so 
you can avoid it next time. And it should be part of David's CI while 
applying patching, too.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
