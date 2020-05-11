Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5437C1CD67C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 12:26:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C7EAC36B27;
	Mon, 11 May 2020 10:26:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8FACC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 10:26:40 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BAM2Jo011706; Mon, 11 May 2020 12:26:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=JOxfg+//EIzdyPpoUcRNv9cDiNoXOl/xkAO+PVn8Imc=;
 b=fj7kvXnFADhcqBRN+KrUKDKMGuiC8N+nrLc5oFawoXZb1SnLBUqKOJfmI/u9KUveYsgs
 p1R/lLegovExqm3p6WaLVcUMWaH4srKLQDZXtfN8P3yDDwVT4xQ4nQyRLP1wHSc0rDUy
 NWp3s/bP1l+jgeTLmAW+Z+1ECKcZd4SVX/ODmhN8xaHuxz66MwFNy26uVXZ04AYdKfYN
 +3b2mySARnFy/1ghBhqusnDGYSFOau0bEK2cCJt93bWZOohjB75oU6lUOZAZG6UE1mU3
 AyQ9P4SI4zJDi8H59bITDmSB1abLg5UW8LqVn43DYuYTmN80J8pSWPUcCSnU37SMrolI ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30wj9w9vek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 12:26:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8130C100038;
 Mon, 11 May 2020 12:26:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C36C2C38C2;
 Mon, 11 May 2020 12:26:15 +0200 (CEST)
Received: from [10.211.5.64] (10.75.127.51) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 11 May
 2020 12:26:08 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
 <20200511112237.20751831@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <a805b5c6-e465-c980-d716-29a655e63b0c@st.com>
Date: Mon, 11 May 2020 12:26:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200511112237.20751831@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_04:2020-05-11,
 2020-05-11 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 00/10] add STM32 FMC2 EBI controller
	driver
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

SGkgTWlxdWVsLAoKT24gNS8xMS8yMCAxMToyMiBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gV2VkLCA2IE1heSAyMDIwCj4gMTE6MTE6MDkgKzAyMDA6Cj4gCj4+
IFRoZSBGTUMyIGZ1bmN0aW9uYWwgYmxvY2sgbWFrZXMgdGhlIGludGVyZmFjZSB3aXRoOiBzeW5j
aHJvbm91cyBhbmQKPj4gYXN5bmNocm9ub3VzIHN0YXRpYyBkZXZpY2VzIChzdWNoIGFzIFBTTk9S
LCBQU1JBTSBvciBvdGhlciBtZW1vcnktbWFwcGVkCj4+IHBlcmlwaGVyYWxzKSBhbmQgTkFORCBm
bGFzaCBtZW1vcmllcy4KPj4gSXRzIG1haW4gcHVycG9zZXMgYXJlOgo+PiAgICAtIHRvIHRyYW5z
bGF0ZSBBWEkgdHJhbnNhY3Rpb25zIGludG8gdGhlIGFwcHJvcHJpYXRlIGV4dGVybmFsIGRldmlj
ZQo+PiAgICAgIHByb3RvY29sCj4+ICAgIC0gdG8gbWVldCB0aGUgYWNjZXNzIHRpbWUgcmVxdWly
ZW1lbnRzIG9mIHRoZSBleHRlcm5hbCBkZXZpY2VzCj4+IEFsbCBleHRlcm5hbCBkZXZpY2VzIHNo
YXJlIHRoZSBhZGRyZXNzZXMsIGRhdGEgYW5kIGNvbnRyb2wgc2lnbmFscyB3aXRoIHRoZQo+PiBj
b250cm9sbGVyLiBFYWNoIGV4dGVybmFsIGRldmljZSBpcyBhY2Nlc3NlZCBieSBtZWFucyBvZiBh
IHVuaXF1ZSBDaGlwCj4+IFNlbGVjdC4gVGhlIEZNQzIgcGVyZm9ybXMgb25seSBvbmUgYWNjZXNz
IGF0IGEgdGltZSB0byBhbiBleHRlcm5hbCBkZXZpY2UuCj4+Cj4+IENoYW5nZXMgaW4gdjQ6Cj4+
ICAgLSBiaW5kaW5nczoKPj4gICAgIC0gZml4IGZpbGVuYW1lOiBzdCxzdG0zMi1mbWMyLWViaS55
YW1sCj4+Cj4+IENoYW5nZXMgaW4gdjM6Cj4+ICAgLSBOQU5EOgo+PiAgICAgLSByZW5hbWUgbGFi
ZWxzIHVzZWQgb24gZXJyb3JzCj4+ICAgICAtIGFkZCBpbiB0aGUgY29tbWl0IGxvZyB0aGUgcmVh
c29uIHRvIGluY3JlYXNlIEZNQzJfVElNRU9VVF9NUyAocGF0Y2ggMykKPj4gICAgIC0gYWRkIE1p
cXVlbCByZXZpZXdlZC1ieSB0YWcgKHBhdGNoZXMgMi80LzUvOSkKPj4gICAtIEVCSToKPj4gICAg
IC0gbW92ZSBpbiBtZW1vcnkgZm9sZGVyCj4+ICAgICAtIG1lcmdlIE1GRCBhbmQgQlVTIGRyaXZl
cnMgdG8gYXZvaWQgYSBNRkQgZHJpdmVyCj4+ICAgLSBiaW5kaW5nczoKPj4gICAgIC0gcGF0dGVy
biBuYW1lIGhhcyBiZWVuIG1vZGlmaWVkCj4+ICAgICAtIHZlbmRvciBwcm9wZXJ0aWVzIGhhdmUg
YmVlbiBtb2RpZmllZAo+PiAgICAgICAtIHMvXy8tLwo+PiAgICAgICAtIGFkZCB1bml0IHN1ZmZp
eCAoLW5zKSBvbiB0aW1pbmcgcHJvcGVydGllcwo+Pgo+PiBDaHJpc3RvcGhlIEtlcmVsbG8gKDEw
KToKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBtYW5hZ2UgYWxsIGVycm9ycyBjYXNl
cyBhdCBwcm9iZSB0aW1lCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogcmVtb3ZlIHVz
ZWxlc3MgaW5saW5lIGNvbW1lbnRzCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNl
IEZNQzJfVElNRU9VVF9NUyBmb3IgdGltZW91dHMKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9m
bWMyOiBjbGVhbnVwCj4+ICAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNlIEZJRUxEX1BS
RVAvRklFTERfR0VUIG1hY3Jvcwo+PiAgICBkdC1iaW5kaW5nczogbXRkOiB1cGRhdGUgU1RNMzIg
Rk1DMiBOQU5EIGNvbnRyb2xsZXIgZG9jdW1lbnRhdGlvbgo+PiAgICBkdC1iaW5kaW5nczogbWVt
b3J5LWNvbnRyb2xsZXI6IGFkZCBTVE0zMiBGTUMyIEVCSSBjb250cm9sbGVyCj4+ICAgICAgZG9j
dW1lbnRhdGlvbgo+PiAgICBtZW1vcnk6IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBF
QkkgY29udHJvbGxlciBkcml2ZXIKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2Ug
cmVnbWFwIEFQSXMKPj4gICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiBnZXQgcmVzb3VyY2Vz
IGZyb20gcGFyZW50IG5vZGUKPj4KPj4gICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL3N0LHN0bTMy
LWZtYzItZWJpLnlhbWwgICAgICB8ICAyNjEgKysrKysKPj4gICAuLi4vYmluZGluZ3MvbXRkL3N0
LHN0bTMyLWZtYzItbmFuZC55YW1sICAgICAgICAgICB8ICAgMTkgKy0KPj4gICBkcml2ZXJzL21l
bW9yeS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTAgKwo+PiAgIGRy
aXZlcnMvbWVtb3J5L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
Cj4+ICAgZHJpdmVycy9tZW1vcnkvc3RtMzItZm1jMi1lYmkuYyAgICAgICAgICAgICAgICAgICAg
fCAxMjA2ICsrKysrKysrKysrKysrKysrKysrCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2Nv
bmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxICsKPj4gICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYyAgICAgICAgICAgICB8IDExNzYgKysrKysrKysrKy0tLS0t
LS0tLQo+PiAgIDcgZmlsZXMgY2hhbmdlZCwgMjA2MSBpbnNlcnRpb25zKCspLCA2MTMgZGVsZXRp
b25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tZW1vcnktY29udHJvbGxlcnMvc3Qsc3RtMzItZm1jMi1lYmkueWFtbAo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lbW9yeS9zdG0zMi1mbWMyLWViaS5jCj4+Cj4gCj4g
SSdtIGZpbmUgd2l0aCB0aGUgcHJlcGFyYXRpb24gcGF0Y2hlcyAxLTUgYnV0IHRoZSBvdGhlciBw
YXRjaGVzIG5lZWQKPiBSb2IncyBoYWNrIGFuZCBwcm9iYWJseSBtb3JlIGNoYW5nZXMuIElmIGl0
J3MgZmluZSB3aXRoIHlvdSBJIGNhbiBhcHBseQo+IHRoZXNlIHBhdGNoZXMgZm9yIHRoZSBuZXh0
IG1lcmdlIHdpbmRvdyBhbmQgbGV0IG1vcmUgdGltZSB0byB3b3JrIG9uCj4gdGhlIGxhc3QgNS4K
PiAKCkkgYW0gZmluZSB3aXRoIHlvdXIgcHJvcG9zYWwuCgpSZWdhcmRzLApDaHJpc3RvcGhlIEtl
cmVsbG8uCgo+IFRoYW5rcywKPiBNaXF1w6hsCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
