Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A99190F74
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 14:27:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3839EC36B0B;
	Tue, 24 Mar 2020 13:27:50 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 848F5C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 13:27:48 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48msW62nF7z1qsZv;
 Tue, 24 Mar 2020 14:27:46 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48msW61Xw6z1qqkB;
 Tue, 24 Mar 2020 14:27:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id KI2dn7oYdaEf; Tue, 24 Mar 2020 14:27:44 +0100 (CET)
X-Auth-Info: O36tjVcTnNqRqjn56Y7nMWOjOOT5bBR6urvusDump94=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 14:27:44 +0100 (CET)
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <466cf542-7575-d791-da81-da32c0919505@denx.de>
 <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <6827412d-1350-5daf-6882-41dc2a9307e5@denx.de>
Date: Tue, 24 Mar 2020 14:27:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <156b55b5-1b09-fa7e-e3bc-a0d5dea870db@st.com>
Content-Language: en-US
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [00/12] add STM32 FMC2 controller drivers
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

T24gMy8yNC8yMCA4OjM2IEFNLCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4gCj4gCj4gT24g
My8yNC8yMCAxOjM3IEFNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMy8yMy8yMCAzOjU4IFBN
LCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4+PiBUaGUgRk1DMiBmdW5jdGlvbmFsIGJsb2Nr
IG1ha2VzIHRoZSBpbnRlcmZhY2Ugd2l0aDogc3luY2hyb25vdXMgYW5kCj4+PiBhc3luY2hyb25v
dXMgc3RhdGljIGRldmljZXMgKHN1Y2ggYXMgUFNOT1IsIFBTUkFNIG9yIG90aGVyIG1lbW9yeS1t
YXBwZWQKPj4+IHBlcmlwaGVyYWxzKSBhbmQgTkFORCBmbGFzaCBtZW1vcmllcy4KPj4+IEl0cyBt
YWluIHB1cnBvc2VzIGFyZToKPj4+IMKgwqAgLSB0byB0cmFuc2xhdGUgQVhJIHRyYW5zYWN0aW9u
cyBpbnRvIHRoZSBhcHByb3ByaWF0ZSBleHRlcm5hbCBkZXZpY2UKPj4+IMKgwqDCoMKgIHByb3Rv
Y29sCj4+PiDCoMKgIC0gdG8gbWVldCB0aGUgYWNjZXNzIHRpbWUgcmVxdWlyZW1lbnRzIG9mIHRo
ZSBleHRlcm5hbCBkZXZpY2VzCj4+PiBBbGwgZXh0ZXJuYWwgZGV2aWNlcyBzaGFyZSB0aGUgYWRk
cmVzc2VzLCBkYXRhIGFuZCBjb250cm9sIHNpZ25hbHMKPj4+IHdpdGggdGhlCj4+PiBjb250cm9s
bGVyLiBFYWNoIGV4dGVybmFsIGRldmljZSBpcyBhY2Nlc3NlZCBieSBtZWFucyBvZiBhIHVuaXF1
ZSBDaGlwCj4+PiBTZWxlY3QuIFRoZSBGTUMyIHBlcmZvcm1zIG9ubHkgb25lIGFjY2VzcyBhdCBh
IHRpbWUgdG8gYW4gZXh0ZXJuYWwKPj4+IGRldmljZS4KPj4+Cj4+PiBDaHJpc3RvcGhlIEtlcmVs
bG8gKDEyKToKPj4+IMKgwqAgZHQtYmluZGluZ3M6IG1mZDogc3RtMzItZm1jMjogYWRkIFNUTTMy
IEZNQzIgY29udHJvbGxlciBkb2N1bWVudGF0aW9uCj4+PiDCoMKgIG1mZDogc3RtMzItZm1jMjog
YWRkIFNUTTMyIEZNQzIgY29udHJvbGxlciBkcml2ZXIKPj4+IMKgwqAgYnVzOiBzdG0zMi1mbWMy
LWViaTogYWRkIFNUTTMyIEZNQzIgRUJJIGNvbnRyb2xsZXIgZHJpdmVyCj4+PiDCoMKgIG10ZDog
cmF3bmFuZDogc3RtMzJfZm1jMjogbWFuYWdlIGFsbCBlcnJvcnMgY2FzZXMgYXQgcHJvYmUgdGlt
ZQo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHJlbW92ZSB1c2VsZXNzIGlubGlu
ZSBjb21tZW50cwo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHVzZSBGTUMyX1RJ
TUVPVVRfTVMgZm9yIHRpbWVvdXRzCj4+PiDCoMKgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjog
Y2xlYW51cAo+Pj4gwqDCoCBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IHVzZSBGSUVMRF9QUkVQ
L0ZJRUxEX0dFVCBtYWNyb3MKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBtb3Zl
IGFsbCByZWdpc3RlcnMKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2UgcmVn
bWFwIEFQSXMKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2Ugc3RtMzJfZm1j
MiBzdHJ1Y3R1cmUgaW4gbmZjIGNvbnRyb2xsZXIKPj4+IMKgwqAgbXRkOiByYXduYW5kOiBzdG0z
Ml9mbWMyOiBhZGQgbmV3IE1QMSBjb21wYXRpYmxlIHN0cmluZwo+Pgo+PiBUaGlzIGRvZXNuJ3Qg
YXBwbHkgdG8gZWl0aGVyIG5leHQgb3IgNS42LXJjNywgZG8geW91IGhhdmUgYSB0cmVlCj4+IHNv
bWV3aGVyZSB3aXRoIHRob3NlIHBhdGNoZXMgYXBwbGllZCA/Cj4+Cj4gCj4gSGkgTWFyZWssCgpI
aSwKCj4gVGhpcyBpbXBsZW1lbnRhdGlvbiBoYXMgYmVlbiBkb25lIG9uIG10ZC9uYW5kL25leHQg
YnJhbmNoLgoKT2Ygd2hpY2ggdHJlZSA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
