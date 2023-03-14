Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46F6B95D8
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 14:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36E0EC6904F;
	Tue, 14 Mar 2023 13:18:43 +0000 (UTC)
Received: from mail.sgstbr.de (mail.sgstbr.de [94.130.16.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF202C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:56:33 +0000 (UTC)
Received: from [IPV6:2a02:810d:ab40:2500:3b46:4127:c750:bf0] (unknown
 [IPv6:2a02:810d:ab40:2500:3b46:4127:c750:bf0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: fabian@blaese.de)
 by mail.sgstbr.de (Postfix) with ESMTPSA id CD29A249440;
 Tue, 14 Mar 2023 10:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blaese.de; s=201803;
 t=1678787793; bh=2YHHIOnfCNb0tl9AGjKfzZ+jPiMxd5LIoKufI4ihP0c=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=wadZqMqq6kk9Y3Z29PL08r1mM8MJuJg10klMiJ1n0XzL6l0Zyqk9ibZ9OVjIFYZzu
 SUJ4nviYK36Z9U64Oxz3J84nk9EoH8BRWu6c5ePrVaVeXnd5VvSXgG8xBeOGXhY5Gj
 UgRbwH2mcggyFnxPc6BSL3MWGcf5kkMxAfJZSIqUidqpt21qIDeUJbZjb9OAxRmALs
 I7LmnONEayviRGhIepyd8MPjGDYstdAqVgmsI2micefL5No1rTR8uIDy2IBIfg0Wn7
 RRzXtWfafKSXmsHhW00rnxzsVX26sc6TlfkVfbXLH2ulX29LQl8hdvPUmXP2slNABu
 WrB6edUDgWytw==
Message-ID: <e9a84798-84c6-1d4b-499b-072868577330@blaese.de>
Date: Tue, 14 Mar 2023 10:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: de-DE
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230314070208.3703963-1-michael.wei.hong.sit@intel.com>
 <20230314070208.3703963-3-michael.wei.hong.sit@intel.com>
From: =?UTF-8?Q?Fabian_Bl=c3=a4se?= <fabian@blaese.de>
In-Reply-To: <20230314070208.3703963-3-michael.wei.hong.sit@intel.com>
X-Mailman-Approved-At: Tue, 14 Mar 2023 13:18:41 +0000
Cc: Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Voon Weifeng <weifeng.voon@intel.com>
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: move fixed-link
 support fixup code
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTQuMDMuMjMgMDg6MDIsIE1pY2hhZWwgU2l0IFdlaSBIb25nIHdyb3RlOgo+IHhwY3NfYW5f
aW5iYW5kIHZhbHVlIGlzIHVwZGF0ZWQgaW4gdGhlIHNwZWVkX21vZGVfMjUwMCBmdW5jdGlvbgo+
IHdoaWNoIHR1cm5zIG9uIHRoZSB4cGNzX2FuX2luYmFuZCBtb2RlLgo+IAo+IE1vdmluZyB0aGUg
Zml4ZWQtbGluayBmaXh1cCBjb2RlIHRvIHJpZ2h0IGJlZm9yZSBwaHlsaW5rIHNldHVwIHRvCj4g
ZW5zdXJlIG5vIG1vcmUgZml4dXAgd2lsbCBhZmZlY3QgdGhlIGZpeGVkLWxpbmsgbW9kZSBjb25m
aWd1cmF0aW9ucy4KPiAKPiBGaXhlczogNzJlZGFmMzlmYzY1ICgic3RtbWFjOiBpbnRlbDogYWRk
IHBoeS1tb2RlIGFuZCBmaXhlZC1saW5rIEFDUEkgX0RTRCBzZXR0aW5nIHN1cHBvcnQiKQo+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhZWwgU2l0IFdlaSBIb25nIDxtaWNoYWVsLndlaS5ob25nLnNpdEBp
bnRlbC5jb20+CgpUZXN0ZWQtYnk6IEZhYmlhbiBCbMOkc2UgPGZhYmlhbkBibGFlc2UuZGU+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
