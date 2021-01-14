Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D46272F66EA
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 18:13:24 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D603C56635;
	Thu, 14 Jan 2021 17:13:24 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A57AC5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 17:13:21 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DGrVn07dtz1rxMB;
 Thu, 14 Jan 2021 18:13:20 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DGrVm4H3Bz1tYVl;
 Thu, 14 Jan 2021 18:13:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id fZrOGiiw3jBl; Thu, 14 Jan 2021 18:13:19 +0100 (CET)
X-Auth-Info: F12FPjym3JLfYswfpsjMD/f+Tu/Bnz80znXtyf7xNOk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 14 Jan 2021 18:13:19 +0100 (CET)
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20201229175521.268234-1-marex@denx.de>
 <c893ad3e-dba2-e1b2-ed7a-24937532d0e6@foss.st.com>
 <30988ce3-93c2-85be-8039-1a886a3f57dc@denx.de>
 <d0ff80e5-5298-c822-ca9f-b4365464fc5a@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ba2efe46-9e5e-f5bf-02d7-537b5667f76a@denx.de>
Date: Thu, 14 Jan 2021 18:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <d0ff80e5-5298-c822-ca9f-b4365464fc5a@foss.st.com>
Content-Language: en-US
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Patrice Chotard <patrice.chotard@st.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: Fix GPIO hog flags
	on DHCOM PicoITX
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

T24gMS8xNC8yMSA2OjExIFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IAo+IAo+IE9uIDEv
MTQvMjEgNjowOCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDEvMTQvMjEgNDoxMSBQTSwg
QWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Cj4+IEhpLAo+Pgo+PiBbLi4u
XQo+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1waWNvaXR4LmR0c2kgCj4+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNv
bS1waWNvaXR4LmR0c2kKPj4+PiBpbmRleCAyNTUyOGExYzA5NmYuLjc1NzcwNzc2NmZhMCAxMDA2
NDQKPj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1waWNvaXR4
LmR0c2kKPj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1waWNv
aXR4LmR0c2kKPj4+PiBAQCAtNDksNyArNDksNyBAQCAmZ3Bpb2Egewo+Pj4+IMKgwqDCoMKgwqDC
oCAqLwo+Pj4+IMKgwqDCoMKgwqAgdXNiLXBvcnQtcG93ZXItaG9nIHsKPj4+Cj4+PiBPbiBteSB0
cmVlIHRoaXMgbm9kZSBpcyAidXNiLXBvcnQtcG93ZXIiLiBEbyB5b3Ugd2FudCB0byB1cGRhdGUg
dGhlIAo+Pj4gbm9kZSBuYW1lIHRvbyA/IEkgY2FuIGRvIGl0IGRpcmVjdGx5IGR1cmluZyB0aGUg
bWVyZ2UgaWYgeW91IHdhbnQuCj4+PiAoTm90ZSwgaXQgaXMgdGhlIGNhc2UgZm9yIERSQzAyIGhv
ZyB1cGRhdGUpLgo+Pgo+PiBQbGVhc2UgcGljayAiW1BBVENIXSBBUk06IGR0czogc3RtMzI6IEZp
eCBHUElPIGhvZyBuYW1lcyBvbiBESENPTSIgCj4+IGZpcnN0LCB0aGVuIHRoaXMgcGF0Y2ggc2hv
dWxkIGFwcGx5IGNsZWFubHkuCj4gCj4gWWVzIEkganVzdCBzYXcgdGhpcyBvbmUuIEl0IGRvZXNu
J3QgY29udGFpbiBhIGZpeGVzIHRhZywgSSBjYW4gYWRkIHRoZSAKPiBzYW1lIHRoYW4gZm9yIG90
aGVyIGhvZyBwYXRjaGVzID8KCklmIHRoYXQgaXMgT0sgd2l0aCB5b3UsIHBsZWFzZSBkby4gVGhh
bmtzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
