Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1DF2C2B08
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 16:19:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 013C0C56630;
	Tue, 24 Nov 2020 15:19:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0ACA1C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 15:19:01 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOFE0qS030284; Tue, 24 Nov 2020 16:18:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=PNHkZVe3AttnbUmeq2ofjE3UKCcL2HVMofSkBnS5Mmg=;
 b=LE3v7C8hAwZzxUZbZ73/ENWPRkfoShYeZbkd5n5lTLdL/LYJrGOIarfn+2EKShYc2qy9
 T7/PC1Te8myqXkiuk6O+DP8dcPm4B7R/iwrq3+GXvsCE6Lp0Y9Wv9Lq9JZRqz5tM4LBE
 OZiS6qKFIdXjdEILVrKJRCNWp5bWq1kn444ZCQDUhuMli3pt1vT/+7nhR7e9bGQBsOdv
 i/7pnt670Doh/b7yKDng7pKwktFGraj8R880eoQuJSlIqD/OcrRIg221lRuSwl8qEqT2
 UkkyyeFH/AhvzMjvU5hM2AG6NOOyVsdb5m/MTYKeVJZQGpDOXZPbujmFXNzLSEbBEkPR 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hja1rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 16:18:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08E9910002A;
 Tue, 24 Nov 2020 16:18:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3C822ADA1B;
 Tue, 24 Nov 2020 16:18:32 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.48) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 16:18:31 +0100
Message-ID: <bd83b9c15f6cfed5df90da4f6b50d1a3f479b831.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Tue, 24 Nov 2020 16:17:42 +0100
In-Reply-To: <20201124145647.GF1551@shell.armlinux.org.uk>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124145647.GF1551@shell.armlinux.org.uk>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
Cc: Andrew Lunn <andrew@lunn.ch>, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, linuxarm@huawei.com, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Yonglong Liu <liuyonglong@huawei.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] net: phy: fix auto-negotiation in case of
	'down-shift'
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

T24gVHVlLCAyMDIwLTExLTI0IGF0IDE0OjU2ICswMDAwLCBSdXNzZWxsIEtpbmcgLSBBUk0gTGlu
dXggYWRtaW4gd3JvdGU6Cj4gT24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMDM6Mzg6NDhQTSArMDEw
MCwgQW50b25pbyBCb3JuZW8gd3JvdGU6Cj4gPiBJZiB0aGUgYXV0by1uZWdvdGlhdGlvbiBmYWls
cyB0byBlc3RhYmxpc2ggYSBnaWdhYml0IGxpbmssIHRoZSBwaHkKPiA+IGNhbiB0cnkgdG8gJ2Rv
d24tc2hpZnQnOiBpdCByZXNldHMgdGhlIGJpdHMgaW4gTUlJX0NUUkwxMDAwIHRvCj4gPiBzdG9w
IGFkdmVydGlzaW5nIDFHYnBzIGFuZCByZXRyaWVzIHRoZSBuZWdvdGlhdGlvbiBhdCAxMDBNYnBz
Lgo+ID4gCj4gPiBGcm9tIGNvbW1pdCA1NTAyYjIxOGUwMDEgKCJuZXQ6IHBoeTogdXNlIHBoeV9y
ZXNvbHZlX2FuZWdfbGlua21vZGUKPiA+IGluIGdlbnBoeV9yZWFkX3N0YXR1cyIpIHRoZSBjb250
ZW50IG9mIE1JSV9DVFJMMTAwMCBpcyBub3QgY2hlY2tlZAo+ID4gYW55bW9yZSBhdCB0aGUgZW5k
IG9mIHRoZSBuZWdvdGlhdGlvbiwgcHJldmVudGluZyB0aGUgZGV0ZWN0aW9uIG9mCj4gPiBwaHkg
J2Rvd24tc2hpZnQnLgo+ID4gSW4gY2FzZSBvZiAnZG93bi1zaGlmdCcgcGh5ZGV2LT5hZHZlcnRp
c2luZyBnZXRzIG91dC1vZi1zeW5jIHdydAo+ID4gTUlJX0NUUkwxMDAwIGFuZCBzdGlsbCBpbmNs
dWRlcyBtb2RlcyB0aGF0IHRoZSBwaHkgaGF2ZSBhbHJlYWR5Cj4gPiBkcm9wcGVkLiBUaGUgbGlu
ayBwYXJ0bmVyIGNvdWxkIHN0aWxsIGFkdmVydGlzZSBoaWdoZXIgc3BlZWRzLAo+ID4gd2hpbGUg
dGhlIGxpbmsgaXMgZXN0YWJsaXNoZWQgYXQgb25lIG9mIHRoZSBjb21tb24gbG93ZXIgc3BlZWRz
Lgo+ID4gVGhlIGxvZ2ljICdhbmQnIGluIHBoeV9yZXNvbHZlX2FuZWdfbGlua21vZGUoKSBiZXR3
ZWVuCj4gPiBwaHlkZXYtPmFkdmVydGlzaW5nIGFuZCBwaHlkZXYtPmxwX2FkdmVydGlzaW5nIHdp
bGwgcmVwb3J0IGFuCj4gPiBpbmNvcnJlY3QgbW9kZS4KPiA+IAo+ID4gSXNzdWUgZGV0ZWN0ZWQg
d2l0aCBhIGxvY2FsIHBoeSBydGw4MjExZiBjb25uZWN0ZWQgd2l0aCBhIGdpZ2FiaXQKPiA+IGNh
cGFibGUgcm91dGVyIHRocm91Z2ggYSB0d28tcGFpcnMgbmV0d29yayBjYWJsZS4KPiA+IAo+ID4g
QWZ0ZXIgYXV0by1uZWdvdGlhdGlvbiwgcmVhZCBiYWNrIE1JSV9DVFJMMTAwMCBhbmQgbWFzay1v
dXQgZnJvbQo+ID4gcGh5ZGV2LT5hZHZlcnRpc2luZyB0aGUgbW9kZXMgdGhhdCBoYXZlIGJlZW4g
ZXZlbnR1YWxseSBkaXNjYXJkZWQKPiA+IGR1ZSB0byB0aGUgJ2Rvd24tc2hpZnQnLgo+IAo+IFNv
cnJ5LCBidXQgbm8uIFdoaWxlIHlvdXIgc29sdXRpb24gd2lsbCBhcHBlYXIgdG8gd29yaywgaW4K
PiBpbnRyb2R1Y2VzIHVuZXhwZWN0ZWQgY2hhbmdlcyB0byB0aGUgdXNlciB2aXNpYmxlIEFQSXMu
Cj4gCj4gPiDCoAlpZiAocGh5ZGV2LT5hdXRvbmVnID09IEFVVE9ORUdfRU5BQkxFICYmIHBoeWRl
di0+YXV0b25lZ19jb21wbGV0ZSkgewo+ID4gKwkJaWYgKHBoeWRldi0+aXNfZ2lnYWJpdF9jYXBh
YmxlKSB7Cj4gPiArCQkJYWR2ID0gcGh5X3JlYWQocGh5ZGV2LCBNSUlfQ1RSTDEwMDApOwo+ID4g
KwkJCWlmIChhZHYgPCAwKQo+ID4gKwkJCQlyZXR1cm4gYWR2Owo+ID4gKwkJCS8qIHVwZGF0ZSBh
ZHZlcnRpc2luZyBpbiBjYXNlIG9mICdkb3duLXNoaWZ0JyAqLwo+ID4gKwkJCW1paV9jdHJsMTAw
MF9tb2RfbGlua21vZGVfYWR2X3QocGh5ZGV2LT5hZHZlcnRpc2luZywKPiA+ICsJCQkJCQkJYWR2
KTsKPiAKPiBJZiBhIGRvd24tc2hpZnQgb2NjdXJzLCB0aGlzIHdpbGwgY2F1c2UgdGhlIGNvbmZp
Z3VyZWQgYWR2ZXJ0aXNpbmcKPiBtYXNrIHRvIGxvc2UgdGhlIDFHIHNwZWVkLCB3aGljaCB3aWxs
IGJlIHZpc2libGUgdG8gdXNlcnNwYWNlLgoKWW91IGFyZSByaWdodCwgaXQgZ2V0cyBwcm9wYWdh
dGVkIHRvIHVzZXIgdGhhdCAxR2JwcyBpcyBub3QgYWR2ZXJ0aXNlZAoKPiBVc2Vyc3BhY2UgZG9l
c24ndCBleHBlY3QgdGhlIGFkdmVydGlzaW5nIG1hc2sgdG8gY2hhbmdlIGJlbmVhdGggaXQuCj4g
U2luY2UgdXBkYXRlcyBmcm9tIHVzZXJzcGFjZSBhcmUgZG9uZSB1c2luZyBhIHJlYWQtbW9kaWZ5
LXdyaXRlIG9mCj4gdGhlIGtzZXR0aW5ncywgdGhpcyBjYW4gaGF2ZSB0aGUgdW5kZXNpcmVkIGVm
ZmVjdCBvZiByZW1vdmluZyAxRwo+IGZyb20gdGhlIGNvbmZpZ3VyZWQgYWR2ZXJ0aXNpbmcgbWFz
ay4KPiAKPiBXZSd2ZSBoYWQgb3RoZXIgUEhZcyBoYXZlIHRoaXMgYmVoYXZpb3VyOyB0aGUgY29y
cmVjdCBzb2x1dGlvbiBpcyBmb3IKPiB0aGUgUEhZIGRyaXZlciB0byBpbXBsZW1lbnQgcmVhZGlu
ZyB0aGUgcmVzb2x1dGlvbiBmcm9tIHRoZSBQSFkgcmF0aGVyCj4gdGhhbiByZWx5aW5nIG9uIHRo
ZSBnZW5lcmljIGltcGxlbWVudGF0aW9uIGlmIGl0IGNhbiBkb3duLXNoaWZ0CgpJZiBpdCdzIGFs
cmVhZHkgdXBzdHJlYW0sIGNvdWxkIHlvdSBwbGVhc2UgcG9pbnQgdG8gb25lIG9mIHRoZSBwaHkg
ZHJpdmVyCnRoYXQgYWxyZWFkeSBpbXBsZW1lbnRzIHRoaXMgcHJvcGVybHk/CgpUaGFua3MKQW50
b25pbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
