Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDAF191298
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Mar 2020 15:15:21 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9E8C36B0B;
	Tue, 24 Mar 2020 14:15:21 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4779C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Mar 2020 14:15:18 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48mtYx6WR1z1rtjS;
 Tue, 24 Mar 2020 15:15:17 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48mtYx5zhVz1r0bx;
 Tue, 24 Mar 2020 15:15:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id rvO_KU7d9yq1; Tue, 24 Mar 2020 15:15:16 +0100 (CET)
X-Auth-Info: QVfDeN9qtYIB6gRNiFccyjUA4fN/jeOlM1sfP9RuI7c=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 15:15:16 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200323023145.3345133-1-marex@denx.de>
 <7f76ea73-122f-3761-a97b-57bdb99dc4fa@st.com>
 <4ffd8b7c-eb7d-83a4-3f6e-e156d3600532@denx.de>
 <c26637b2-7cf6-b7e2-3301-fafbbfde508e@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <028556ba-f088-bf04-4473-a69569157411@denx.de>
Date: Tue, 24 Mar 2020 15:15:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c26637b2-7cf6-b7e2-3301-fafbbfde508e@st.com>
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

T24gMy8yNC8yMCAzOjA3IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IAo+IAo+IE9uIDMv
MjQvMjAgMjoyMiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDMvMjQvMjAgMjowNCBQTSwg
QWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMy8yMy8yMCAzOjMxIEFNLCBN
YXJlayBWYXN1dCB3cm90ZToKPj4+PiBUaGUgREggUERLMiBjYW4gYmUgcG9wdWxhdGVkIHdpdGgg
U29NIHdpdGggYW55IFNUTTMyTVAxNXggdmFyaWFudC4KPj4+PiBBZGQgdGhlIERUcyBkZXNjcmli
aW5nIHRoZSByZW1haW5pbmcgY29tYmluYXRpb25zLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
TWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+Pj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAc3QuY29tPgo+Pj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxp
bi5zdG0zMkBnbWFpbC5jb20+Cj4+Pj4gQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5jaG90
YXJkQHN0LmNvbT4KPj4+PiBDYzogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBz
dC5jb20+Cj4+Pj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
Pj4+PiBUbzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gLS0tCj4+
Pj4gTk9URTogSXMgdGhlcmUgYSBiZXR0ZXIgd2F5IHRvIGRvIHRoaXMgdGhhbiB0byBoYXZlIHRo
aXMga2luZCBvZiBhCj4+Pj4gwqDCoMKgwqDCoGNvbWJpbmF0b3JpYWwgZXhwbG9zaW9uIG9mIERU
cyA/Cj4+Pgo+Pj4gSSBoYXZlIG5vIGJldHRlciBpZGVhLiBRdWVzdGlvbiB3YXMgdGhlIHNhbWUg
Zm9yIHN0bTMyIGJvYXJkcywgYW5kIEkKPj4+IGNob3NlIHRvIHRha2UgdGhpcyBvcHRpb24uCj4+
Cj4+IE9uZSBvcHRpb24gd291bGQgYmUgdG8ganVzdCBoYXZlIERUIGZvciB0aGUgbW9zdCBmZWF0
dXJlLWNvbXBsZXRlIG9wdGlvbgo+PiAoMTU3KSBhbmQgdGhlbiBoYXZlIFUtQm9vdCByZW1vdmUg
dGhlIG5vZGVzIGZvciBIVyB3aGljaCBpcyBub3QgcHJlc2VudAo+PiBvbiB0aGUgcGFydGljdWxh
ciBTb0Mgb3B0aW9uIGlmIGl0J3Mgb25lIG9mIHRoZSBtb3JlIGxpbWl0ZWQgb25lcyAoMTUzLAo+
PiAxNTEpLgo+Pgo+IAo+IFllcyBpdCB3YXMgYSBwb3NzaWJpbGl0eSB0aGF0IEkgZGlzY3Vzc2Vk
IHdpdGgga2V2aW4gSC4gYXQgdGhlIGxhdGVzdAo+IEVMQ0UgYnV0IGF0IHRoZSBlbmQgdGhlIGJl
c3Qgd2F5IHRvIGZvbGxvdyB3YXMgdG8gZW5oYW5jZSBudW1iZXIgb2YgZHRzCj4gZmlsZXMuIFRo
ZSBiZXN0IHdvdWxkIGJlIHRvIGhhdmUgZGVkaWNhdGVkIGZvbGRlcnMgYnV0IGl0IGlzIGFub3Ro
ZXIgc3RvcnkuCgpPciB1c2UgRFQgb3ZlcmxheXMgc29tZWhvdyA/IFUtQm9vdCBjYW4gYXBwbHkg
RFRPcyBvbnRvIERUIGJlZm9yZQpib290aW5nIExpbnV4LgoKSGF2aW5nIHRvbnMgb2YgRFRzIG9u
IGEgc3lzdGVtIGlzIGEgbG90IG9mIGR1cGxpY2F0aW9uLCBJIGRvbid0IHJlYWxseQpsaWtlIHRo
YXQuCgpCdXQgZm9yIHN0YXJ0ZXJzLCBmZWVsIGZyZWUgdG8gcmV2aWV3IHRoaXMgcGF0Y2guCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
