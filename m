Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F05232CF34
	for <lists+linux-stm32@lfdr.de>; Thu,  4 Mar 2021 10:02:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C083EC57B76;
	Thu,  4 Mar 2021 09:02:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31CB6C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Mar 2021 09:02:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B6CD1FB;
 Thu,  4 Mar 2021 01:02:01 -0800 (PST)
Received: from [10.57.17.29] (unknown [10.57.17.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 935153F73B;
 Thu,  4 Mar 2021 01:01:58 -0800 (PST)
To: dillon min <dillon.minfei@gmail.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-2-git-send-email-dillon.minfei@gmail.com>
 <5284d390-c03a-4035-df5a-10d6cd60e47b@arm.com>
 <CAL9mu0KUhctbBzmem1ZSgEwf5CebivHOSUr9Q7VTyzib8pW=Cw@mail.gmail.com>
 <5efe3d44-8045-e376-003e-3ccbff54fb23@arm.com>
 <CAL9mu0JoHqo_wnpNN9ZqRnzzKjhOwEktZ5yPtO8-6WBh51g1BQ@mail.gmail.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <703c43f1-7b83-32ec-7c50-baab00b6bb34@arm.com>
Date: Thu, 4 Mar 2021 09:02:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JoHqo_wnpNN9ZqRnzzKjhOwEktZ5yPtO8-6WBh51g1BQ@mail.gmail.com>
Content-Language: en-US
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] ARM: ARMv7-M: Fix register restore
 corrupt after svc call
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

T24gMy80LzIxIDU6NDIgQU0sIGRpbGxvbiBtaW4gd3JvdGU6Cj4gT2thee+8jCBnb3QgaXQuIGFm
dGVyIGFkZGluZyBtc3AvcHNwIHN3aXRjaCBjb2RlIGluIFJUT1MsIG5vdyB0aGUga2VybmVsCj4g
Y2FuIGJlIGxvYWRlZCBub3JtYWxseQo+IHdpdGhvdXQgYW55IG1vZGlmaWNhdGlvbi4KCllheSEK
Cj4gCj4gU28sIGp1c3QgZHJvcCB0aGUgY2hhbmdlcyBpbiBwcm9jLXY3bS5TLgoKR2xhZCB0byBz
ZWUgdGhleSBhcmUgbm90IHN0cmljdGx5IG5lY2Vzc2FyeSA6KQoKVGhhbmtzClZsYWRpbWlyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
