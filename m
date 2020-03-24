Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 250BB190F62
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 14:22:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4510C36B0B;
	Tue, 24 Mar 2020 13:22:35 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D718BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 13:22:32 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48msP3688pz1rvBb;
 Tue, 24 Mar 2020 14:22:31 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48msP35PShz1r0bv;
 Tue, 24 Mar 2020 14:22:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id T8RBuOq0MbG2; Tue, 24 Mar 2020 14:22:28 +0100 (CET)
X-Auth-Info: LeKA07XIgaYr+0Rh30CeUF0hXhMSqkO01ilXetBVGEI=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 14:22:27 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200323023145.3345133-1-marex@denx.de>
 <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
Date: Tue, 24 Mar 2020 14:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] [RFC] ARM: dts: stm32: Add DTs for
 STM32MP15x variants of the DH SOM and PDK2
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

T24gMy8yNC8yMCAyOjA0IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IAo+IAo+IE9uIDMv
MjMvMjAgMzozMSBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IFRoZSBESCBQREsyIGNhbiBiZSBw
b3B1bGF0ZWQgd2l0aCBTb00gd2l0aCBhbnkgU1RNMzJNUDE1eCB2YXJpYW50Lgo+PiBBZGQgdGhl
IERUcyBkZXNjcmliaW5nIHRoZSByZW1haW5pbmcgY29tYmluYXRpb25zLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4gQ2M6IEFsZXhhbmRyZSBUb3Jn
dWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29x
dWVsaW4uc3RtMzJAZ21haWwuY29tPgo+PiBDYzogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNo
b3RhcmRAc3QuY29tPgo+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBz
dC5jb20+Cj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+
IFRvOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gLS0tCj4+IE5PVEU6
IElzIHRoZXJlIGEgYmV0dGVyIHdheSB0byBkbyB0aGlzIHRoYW4gdG8gaGF2ZSB0aGlzIGtpbmQg
b2YgYQo+PiDCoMKgwqDCoGNvbWJpbmF0b3JpYWwgZXhwbG9zaW9uIG9mIERUcyA/Cj4gCj4gSSBo
YXZlIG5vIGJldHRlciBpZGVhLiBRdWVzdGlvbiB3YXMgdGhlIHNhbWUgZm9yIHN0bTMyIGJvYXJk
cywgYW5kIEkKPiBjaG9zZSB0byB0YWtlIHRoaXMgb3B0aW9uLgoKT25lIG9wdGlvbiB3b3VsZCBi
ZSB0byBqdXN0IGhhdmUgRFQgZm9yIHRoZSBtb3N0IGZlYXR1cmUtY29tcGxldGUgb3B0aW9uCigx
NTcpIGFuZCB0aGVuIGhhdmUgVS1Cb290IHJlbW92ZSB0aGUgbm9kZXMgZm9yIEhXIHdoaWNoIGlz
IG5vdCBwcmVzZW50Cm9uIHRoZSBwYXJ0aWN1bGFyIFNvQyBvcHRpb24gaWYgaXQncyBvbmUgb2Yg
dGhlIG1vcmUgbGltaXRlZCBvbmVzICgxNTMsCjE1MSkuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
