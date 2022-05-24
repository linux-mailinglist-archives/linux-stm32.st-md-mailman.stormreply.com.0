Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5C532C37
	for <lists+linux-stm32@lfdr.de>; Tue, 24 May 2022 16:31:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87B3BC03FDB;
	Tue, 24 May 2022 14:31:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 454C8C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 May 2022 14:31:47 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OD9lI2006610;
 Tue, 24 May 2022 16:30:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AQKsEZBpRPgvOP9pH7S/TD4toEUBrB462VVqfLm/lIg=;
 b=5vp8d10b91pQwCDM64drMqKGwHc5+FDSrh6uBPoLyCI0i42OlptsPwe+5J9lyYa8Dk1h
 GpVs+BkZVx4v3eb7QAELGQebfGvN8ZoiY+dP24PwjD2PlmtUmSEu4ZCOfdsdr+pxISC/
 TkPctLdGreD7CSfD9skaBTsCvrrNpTZz4x8wOziWNBjFI8aVY7VTT1Bne02vOcb593mF
 +3MxGBBbnchvs9YXFg5RKF+Mx/vtkCxedo+0cF/vWd0jmdGgMk74zEivMo7Xy3DZ4rdy
 vnT8pn7p10xwjQzcbkLlvC/SKsFcYGcI9AHKy5YpRvtdziEGpArWDaZgKMO+Yn6RenCf aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g6rv6rfhk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 16:30:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A8C110002A;
 Tue, 24 May 2022 16:30:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 08D1323152E;
 Tue, 24 May 2022 16:30:40 +0200 (CEST)
Received: from [10.211.10.185] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 24 May
 2022 16:30:39 +0200
Message-ID: <d5ab354a-eb10-d31c-d55e-46a4c4d1a4ce@foss.st.com>
Date: Tue, 24 May 2022 16:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: tangbin <tangbin@cmss.chinamobile.com>, Mark Brown <broonie@kernel.org>
References: <20220519124235.21100-1-tangbin@cmss.chinamobile.com>
 <69d5cef3-57c0-9bc7-a83b-a85ef1c4cf29@foss.st.com>
 <YovZAf4S0XphBsco@sirena.org.uk>
 <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <3fb8d7f8-4506-3b28-22cb-863bda1f21c8@cmss.chinamobile.com>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_07,2022-05-23_01,2022-02-23_01
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, mcoquelin.stm32@gmail.com,
 arnaud.pouliquen@foss.st.com, perex@perex.cz,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Use
 of_device_get_match_data() tosimplify code
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

SGkgVGFuZywKCk9uIDUvMjQvMjIgMDM6NDQsIHRhbmdiaW4gd3JvdGU6Cj4gSGkgTWFyayAmIE9s
aXZpZXLvvJoKPiAKPiBPbiAyMDIyLzUvMjQgMjo1NywgTWFyayBCcm93biB3cm90ZToKPj4gT24g
TW9uLCBNYXkgMjMsIDIwMjIgYXQgMDM6Mjg6NDhQTSArMDIwMCwgT2xpdmllciBNT1lTQU4gd3Jv
dGU6Cj4+Cj4+PiBUaGUgY3VycmVudCBwYXRjaCByZXF1aXJlcyBhIGNoYW5nZSBpbiB0aGUgZHJp
dmVyLgo+Pj4gRWl0aGVyIGNoYW5naW5nIFNUTV9TQUlfeF9JRCBlbnVtcywgb3IgcmVwbGFjaW5n
IGRhdGEgYnkgYSBzdHJ1Y3QuCj4+PiBGb3IgaW5zdGFuY2U6Cj4+PiBzdHJ1Y3Qgc3RtMzJfc2Fp
X2NvbXBfZGF0YSB7Cj4+PiDCoMKgwqDCoHVuc2lnbmVkIGludCBpZDsKPj4+IH0KPj4+IHN0cnVj
dCBzdG0zMl9zYWlfY29tcF9kYXRhIHN0bTMyX3NhaV9jb21wX2RhdGFfYSA9IHsKPj4+IMKgwqDC
oMKgLmlkID0gU1RNX1NBSV9BX0lEOwo+Pj4gfQo+Pj4gc3RydWN0IG9mX2RldmljZV9pZCBzdG0z
Ml9zYWlfc3ViX2lkc1tdID0gewo+Pj4gwqDCoMKgwqAuZGF0YSA9ICZzdG0zMl9zYWlfY29tcF9k
YXRhX2F9LAo+Pj4gfQo+PiBFaXRoZXIgYXBwcm9hY2ggd29ya3MgZm9yIG1lIChvciBhIHJldmVy
dCBmb3IgdGhhdCBtYXR0ZXIpLgo+IAo+ICDCoMKgwqAgVGhhbmtzIGZvciB5b3VyIGFkdmljZSwg
SSB3YXMgdGhvdWdodGxlc3MuCj4gCj4gIMKgwqDCoCBJIHRoaW5rIGNoYW5nZSB0aGUgZGF0ZSBv
ZiBTVE1fU0FJX3hfSUQgbWF5YmUgc2ltcGxlLiBCdXQgaWYgd2UgCj4gZG9uJ3QgY2hhbmdlIHRo
ZSBpZCwKPiAKPiB3aGF0IGFib3V0IGFkZCBhICIjZGVmaW5lIiBsaWtlIHRoZSBsaW5lIDQ3Ogo+
IAo+ICNkZWZpbmUgU1RNX1NBSV9JU19TVUIoeCkgKCh4KS0+aWQgPT0gU1RNX1NBSV9BX0lEIHx8
ICh4KS0+aWQgPT0gCj4gU1RNX1NBSV9CX0lEKQo+IAo+IHRoZW4gaW4gdGhlIGp1ZGdlbWVudCwg
d3UgdXNlOgo+IAo+ICDCoMKgwqAgc2FpLT5pZCA9ICh1aW50cHRyX3Qpb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+IAo+ICDCoMKgwqAgaWYgKCFTVE1fU0FJX0lTX1NVQihz
YWkpKQo+IAo+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAKPiAKPiBp
ZiB5b3UgdGhpbmsgdGhhdCdzIG9rLCBJIHdpbGwgc2VuZCBwYXRjaCB2MiBmb3IgeW91IC4KPiAK
CklmIHdlIGFsbG93IG51bGwgdmFsdWUgaW4gU1RNX1NBSV9JU19TVUIoc2FpKSBjaGVjaywgd2Ug
Y2FuIG1pc3MgcmVhbCAKTlVMTCBwb2ludGVyIGVycm9yIGZyb20gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKCkuCgpUaGUgc2ltcGxlc3Qgd2F5IGlzIHRvIGNoYW5nZSBTVE1fU0FJX3hfSUQgZW51
bXMgSSB0aGluay4KQnV0IGhvbm5lc3RseSwgSSBmZWVsIG1vcmUgY29tZm9ydGFibGUgdG8gbGV0
IHRoZSBkcml2ZXIgdW5jaGFuZ2VkLgoKQlJzCk9saXZpZXIKCj4gVGhhbmtzCj4gCj4gVGFuZyBC
aW4KPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
