Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63EAB14881
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E895C36B3F;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31719C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Jul 2025 05:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/KPWTypw68rlP2ivlSO9Nj2ROf6caTcYTdVpsWKxvc=; b=bHtpiwwMCcg9TRDTp1vAU0mAOP
 UjNvWxcSyqSJ1QV/cYhkOdE7c4/VHxifdUj0l19MpDEXumGku8zcyYtRE/wTEdvZMmJBBicB0kTEh
 Wg5k1ZH2+24DmV/mquzZDK+0fpj65l1nbauMJG6b7w/oJv3LZdhyFJy3dOhRUFG8pypH+zRXWzqDC
 fGUWkB3gjZAzgGhQ8EMG3d5s0ga0H4gQMlHyQQVTG9fPhWoRIZNXRpVsIEhfA0wq54aCWnnUFK1wc
 dmH2yiqBHomhi/mzhjf/YKY0q3UlI4McXLMS7XTKkJJBGVIGz1eC1NKy4x1dF3iMmZblqw8P9zDuo
 UtlbD7jQ==;
Received: from [89.212.21.243] (port=48060 helo=[192.168.69.116])
 by cpanel.siel.si with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96.2)
 (envelope-from <primoz.fiser@norik.com>) id 1ucdN0-000Axh-0k;
 Fri, 18 Jul 2025 07:10:53 +0200
Message-ID: <4a882430-877c-40e9-b7bd-21d423340b20@norik.com>
Date: Fri, 18 Jul 2025 07:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250717090037.4097520-1-primoz.fiser@norik.com>
 <20250717070204.66e34588@kernel.org>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20250717070204.66e34588@kernel.org>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id:
 primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: imx@lists.linux.dev, Saravana Kannan <saravanak@google.com>,
 Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/2] Populate of_node for i.MX netdevs
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

Hi Jakub,

On 17. 07. 25 16:02, Jakub Kicinski wrote:
> On Thu, 17 Jul 2025 11:00:35 +0200 Primoz Fiser wrote:
>> Recently when working on predictable network names for i.MX SoCs, it
>> was discovered that of_node sysfs properties are missing for FEC and
>> EQOS interfaces.
>>
>> Without this, udev is unable to expose the OF_* properties (OF_NAME,
>> OF_FULLNAME, OF_COMPATIBLE, OF_ALIAS, etc.) and thus we cannot identify
>> interface based on those properties.
>>
>> Fix this by populating netdev of_node in respective drivers.
> 
> Seems legit, but would be good to CC Open Firmware maintainers.

Added Rob & Saravana to CC.

> 
> If we want to make propagating the OF linkage a think I think we should
> add a flavor of SET_NETDEV_DEV() which does that for the caller.
> SET_NETDEV_DEV_OF() ?

OK, so you suggest to add MACRO:

#define SET_NETDEV_DEV_OF(net, np)  ((net)->dev.of_node = (np))

I like the idea too.

Way cleaner especially if others will join later.

Shall we do that already for v2 or as a separate series?

BR,
Primoz


-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
