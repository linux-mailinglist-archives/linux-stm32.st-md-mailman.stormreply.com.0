Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC587AC0A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 17:56:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3EA4C6B46B;
	Wed, 13 Mar 2024 16:56:39 +0000 (UTC)
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27490C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 08:52:15 +0000 (UTC)
X-SubmittedBy: id balejk@matfyz.cz subject
 /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,
 +20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
 serial F5FD910E8FE2121B897F7E55B84E351D
 issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
 auth type TLS.CUNI
Received: from localhost (koleje-wifi-0013.koleje.cuni.cz [78.128.191.13])
 (authenticated)
 by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 42D8neSJ059445
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Wed, 13 Mar 2024 09:49:41 +0100 (CET)
 (envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Date: Wed, 13 Mar 2024 09:50:11 +0100
Message-Id: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
To: <dimitri.ledkov@canonical.com>, "Johannes Berg" <johannes@sipsolutions.net>
From: "Karel Balej" <balejk@matfyz.cz>
In-Reply-To: <20231010212240.61637-1-dimitri.ledkov@canonical.com>
X-Mailman-Approved-At: Wed, 13 Mar 2024 16:56:38 +0000
Cc: herbert@gondor.apana.org.au, linux-wireless@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, mcgrof@kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-modules@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove sha1
	support
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

Dimitri, Johannes,

ever since upgrading to Linux v6.7 I am unable to connect to a 802.1X
wireless network (specifically, eduroam). In my dmesg, the following
messages appear:

	[   68.161621] wlan0: authenticate with xx:xx:xx:xx:xx:xx (local address=xx:xx:xx:xx:xx:xx)
	[   68.163733] wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
	[   68.165773] wlan0: authenticated
	[   68.166785] wlan0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
	[   68.168498] wlan0: RX AssocResp from xx:xx:xx:xx:xx:xx (capab=0x1411 status=0 aid=4)
	[   68.172445] wlan0: associated
	[   68.204956] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by xx:xx:xx:xx:xx:xx
	[   70.262032] wlan0: deauthenticated from xx:xx:xx:xx:xx:xx (Reason: 23=IEEE8021X_FAILED)
	[   73.065966] wlan0: authenticate with xx:xx:xx:xx:xx:xx (local address=xx:xx:xx:xx:xx:xx)
	[   73.068006] wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
	[   73.070166] wlan0: authenticated
	[   73.070756] wlan0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
	[   73.072807] wlan0: RX AssocResp from xx:xx:xx:xx:xx:xx (capab=0x1411 status=0 aid=4)
	[   73.076676] wlan0: associated
	[   73.120396] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by xx:xx:xx:xx:xx:xx
	[   75.148376] wlan0: deauthenticating from xx:xx:xx:xx:xx:xx by local choice (Reason: 23=IEEE8021X_FAILED)
	[   77.718016] wlan0: authenticate with xx:xx:xx:xx:xx:xx (local address=xx:xx:xx:xx:xx:xx)
	[   77.720137] wlan0: send auth to xx:xx:xx:xx:xx:xx (try 1/3)
	[   77.722670] wlan0: authenticated
	[   77.724737] wlan0: associate with xx:xx:xx:xx:xx:xx (try 1/3)
	[   77.726172] wlan0: RX AssocResp from xx:xx:xx:xx:xx:xx (capab=0x1411 status=0 aid=4)
	[   77.730822] wlan0: associated
	[   77.830763] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by xx:xx:xx:xx:xx:xx
	[   79.784199] wlan0: deauthenticating from xx:xx:xx:xx:xx:xx by local choice (Reason: 23=IEEE8021X_FAILED)

The connection works fine with v6.6 and I have bisected the problem to
the revision introduced by this patch (16ab7cb5825f mainline).

My wireless kernel driver is iwlwifi and I use iwd. I started the bisect
with a config copied from my distribution package [1].

Would you please help me with this? Please let me know if I forgot to
mention something which could be helpful in resolving this.

[1] https://raw.githubusercontent.com/void-linux/void-packages/master/srcpkgs/linux6.6/files/x86_64-dotconfig

Thank you very much, kind regards,
K. B.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
