Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AED1A6C826B
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Mar 2023 17:34:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BE53C6A603;
	Fri, 24 Mar 2023 16:34:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC1EEC69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Mar 2023 16:34:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32ODBKRW011039; Fri, 24 Mar 2023 17:34:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SboRCbcyRuV05Ygpi/rKpxPTf5aTWPczlwFRg2CMDRo=;
 b=T1+qXB3/c6jdtvoAkUgyEpBxAGzqwuBFCsWuiyKbxIETREUwr3A76lTJOo0vBuZAkNTy
 VO0l4l7EVVtHUdnZZ3eEBAxShGVOxviBwXQq3yHB7Ov0nom1tKaaNk+rvVNH4PSDsOwH
 Xhn3tCgGE7FhwD6BTqIbLU2FYxUu7XEBw07cKlsqF3r+W2i6u0FrfqkbGr9x/NL2ctgi
 3r1uqqtHemjlgCwEJ9cPCAFQEuz79w6yBOgSiZs7eAT6/qYvoaiOx51qKFUexd2mQj1O
 HdgCQXQqejL4okcP6ITmGvn+/pK3Hghd6XeTjJV5SljswAZOxNp5Ob+UdTIPDvbOg3AX hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pgxjwe1x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Mar 2023 17:34:16 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 713F210002A;
 Fri, 24 Mar 2023 17:34:15 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C90921ADAE;
 Fri, 24 Mar 2023 17:34:15 +0100 (CET)
Received: from [10.48.0.175] (10.48.0.175) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 24 Mar
 2023 17:34:15 +0100
Message-ID: <f4c32aa5-e5b1-6465-7708-ef0281baf0af@foss.st.com>
Date: Fri, 24 Mar 2023 17:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20230324160918.826452-1-christophe.kerello@foss.st.com>
 <20230324172528.4d3ccd4b@xps-13>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <20230324172528.4d3ccd4b@xps-13>
X-Originating-IP: [10.48.0.175]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: do not support
	EDO mode
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

SGVsbG8gTWlxdWVsLAoKT24gMy8yNC8yMyAxNzoyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBv
biBGcmksIDI0IE1hciAyMDIzIDE3OjA5OjE4ICswMTAwOgo+IAo+PiBGTUMyIGNvbnRyb2xsZXIg
ZG9lcyBub3Qgc3VwcG9ydCBFRE8gbW9kZSAodGltaW5ncyBtb2RlIDQgYW5kIDUpLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3Nz
LnN0LmNvbT4KPj4gRml4ZXM6IDJjZDQ1N2YzMjhjMSAoIm10ZDogcmF3bmFuZDogc3RtMzJfZm1j
MjogYWRkIFNUTTMyIEZNQzIgTkFORCBmbGFzaCBjb250cm9sbGVyIGRyaXZlciIpCj4+IC0tLQo+
PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jIHwgMyArKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jCj4+IGluZGV4IDVkNjI3MDQ4YzQyMC4uM2FiYjYzZDAwYTBiIDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiArKysg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiBAQCAtMTUzMSw2ICsx
NTMxLDkgQEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19zZXR1cF9pbnRlcmZhY2Uoc3RydWN0
IG5hbmRfY2hpcCAqY2hpcCwgaW50IGNoaXBuciwKPj4gICAJaWYgKElTX0VSUihzZHJ0KSkKPj4g
ICAJCXJldHVybiBQVFJfRVJSKHNkcnQpOwo+PiAgIAo+PiArCWlmIChzZHJ0LT50UkNfbWluIDwg
MzAwMDApCj4gCj4gV2hlbiBpbnRyb2R1Y2luZyBOVi1ERFIgc3VwcG9ydCB3ZSBhcyB3ZWxsIGFk
ZGVkIGEgdGltaW5ncy5tb2RlIGZpZWxkLAo+IHBlcmhhcHMgeW91IGNvdWxkIHVzZSBpdD8KClll
cywgSSBjYW4gdXNlIGl0LiBJdCB3aWxsIGJlIGRvbmUgaW4gVjIuCgpSZWdhcmRzLApDaHJpc3Rv
cGhlIEtlcmVsbG8uCgo+IAo+PiArCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsKPj4gICAJaWYg
KGNoaXBuciA9PSBOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkKPj4gICAJCXJldHVybiAwOwo+
PiAgIAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
