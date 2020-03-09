Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BA117E2BF
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Mar 2020 15:52:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D53FC36B0B;
	Mon,  9 Mar 2020 14:52:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 225D3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2020 14:52:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029EqZPX019446; Mon, 9 Mar 2020 15:52:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=dA0MNAnLTz0IYOJPapDxgoGP7Yrm9Fs9Y8Li113GzqI=;
 b=Ah6XKPYgFgDp1fh0mqFg0w72uX4L+DX/d8WYRQahlDj6ggls2OXJBHcNB+f1GJhw4iYl
 ZdmQAYgRgwMvhuvmVob4jOaX+GgRdWO7pR8+mx04h+29hvImoaYMSXOcweTe8QrNMNX4
 8c7QLwGIbQSx8mTXFFWFLpEAy9wsSFRK2b2kYH79OyOifnTa5idFnZ/+K+FLId9GN8Xx
 X5VAwc7zHYAad7lHDQuuO8itqJk5tZUTY/735FqJtbbVvEu8AJ/ige6EeW+Pizatk7Da
 EO8rWKrB/I0NElleF9UW+yOXh/Xf4qghnbK3E9ZxxubGSLOTd1DJy0GmB4v7NslSLdEX 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ym2924v6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 15:52:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A82100034;
 Mon,  9 Mar 2020 15:52:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E56492A5443;
 Mon,  9 Mar 2020 15:52:28 +0100 (CET)
Received: from [10.48.1.172] (10.75.127.49) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Mar
 2020 15:52:28 +0100
To: Alain Volmat <alain.volmat@st.com>, <wsa@the-dreams.de>
References: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
From: Pierre Yves MORDRET <pierre-yves.mordret@st.com>
Message-ID: <5b19cf9c-9556-09c9-929d-0c396f689521@st.com>
Date: Mon, 9 Mar 2020 15:52:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1583413141-1268-1-git-send-email-alain.volmat@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG5NODE2.st.com
 (10.75.127.14)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_06:2020-03-09,
 2020-03-09 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 fabrice.gasnier@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: do not backup read-only
	PECR register
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

SGkgQWxhaW4KCkxvb2sgZ29vZCBmb3IgbWUKClJldmlld2VkLWJ5OiBQaWVycmUtWXZlcyBNT1JE
UkVUIDxwaWVycmUteXZlcy5tb3JkcmV0QHN0LmNvbT4KClJlZ2FyZHMKCk9uIDMvNS8yMCAxOjU5
IFBNLCBBbGFpbiBWb2xtYXQgd3JvdGU6Cj4gVGhlIFBFQ1IgcmVnaXN0ZXIgcHJvdmlkZXMgcmVj
ZWl2ZWQgcGFja2V0IGNvbXB1dGVkIFBFQyB2YWx1ZS7CoAo+IEl0IG1ha2VzIG5vIHNlbnNlIHJl
c3RvcmluZyBpdHMgdmFsdWUgYWZ0ZXIgYSByZXNldCwgYW5kIGFueXdheSwKPiBhcyByZWFkLW9u
bHkgcmVnaXN0ZXIgaXQgY2Fubm90IGJlIHJlc3RvcmVkLgo+IAo+IEZpeGVzOiBlYTZkZDI1ZGVl
YjUgKCJpMmM6IHN0bTMyZjc6IGFkZCBQTV9TTEVFUCBzdXNwZW5kL3Jlc3VtZSBzdXBwb3J0IikK
PiBTaWduZWQtb2ZmLWJ5OiBBbGFpbiBWb2xtYXQgPGFsYWluLnZvbG1hdEBzdC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwgNCAtLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXN0bTMyZjcuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4gaW5k
ZXggMzc4OTU2YWM2ZDFkLi40ZDc0MDFkNjJiNzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1zdG0zMmY3LmMKPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMy
ZjcuYwo+IEBAIC0xNzYsNyArMTc2LDYgQEAKPiAgICogQGNyMjogQ29udHJvbCByZWdpc3RlciAy
Cj4gICAqIEBvYXIxOiBPd24gYWRkcmVzcyAxIHJlZ2lzdGVyCj4gICAqIEBvYXIyOiBPd24gYWRk
cmVzcyAyIHJlZ2lzdGVyCj4gLSAqIEBwZWNyOiBQRUMgcmVnaXN0ZXIKPiAgICogQHRtZ3I6IFRp
bWluZyByZWdpc3Rlcgo+ICAgKi8KPiAgc3RydWN0IHN0bTMyZjdfaTJjX3JlZ3Mgewo+IEBAIC0x
ODQsNyArMTgzLDYgQEAgc3RydWN0IHN0bTMyZjdfaTJjX3JlZ3Mgewo+ICAJdTMyIGNyMjsKPiAg
CXUzMiBvYXIxOwo+ICAJdTMyIG9hcjI7Cj4gLQl1MzIgcGVjcjsKPiAgCXUzMiB0bWdyOwo+ICB9
Owo+ICAKPiBAQCAtMjE0Niw3ICsyMTQ0LDYgQEAgc3RhdGljIGludCBzdG0zMmY3X2kyY19yZWdz
X2JhY2t1cChzdHJ1Y3Qgc3RtMzJmN19pMmNfZGV2ICppMmNfZGV2KQo+ICAJYmFja3VwX3JlZ3Mt
PmNyMiA9IHJlYWRsX3JlbGF4ZWQoaTJjX2Rldi0+YmFzZSArIFNUTTMyRjdfSTJDX0NSMik7Cj4g
IAliYWNrdXBfcmVncy0+b2FyMSA9IHJlYWRsX3JlbGF4ZWQoaTJjX2Rldi0+YmFzZSArIFNUTTMy
RjdfSTJDX09BUjEpOwo+ICAJYmFja3VwX3JlZ3MtPm9hcjIgPSByZWFkbF9yZWxheGVkKGkyY19k
ZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19PQVIyKTsKPiAtCWJhY2t1cF9yZWdzLT5wZWNyID0gcmVh
ZGxfcmVsYXhlZChpMmNfZGV2LT5iYXNlICsgU1RNMzJGN19JMkNfUEVDUik7Cj4gIAliYWNrdXBf
cmVncy0+dG1nciA9IHJlYWRsX3JlbGF4ZWQoaTJjX2Rldi0+YmFzZSArIFNUTTMyRjdfSTJDX1RJ
TUlOR1IpOwo+ICAKPiAgCXBtX3J1bnRpbWVfcHV0X3N5bmMoaTJjX2Rldi0+ZGV2KTsKPiBAQCAt
MjE3OCw3ICsyMTc1LDYgQEAgc3RhdGljIGludCBzdG0zMmY3X2kyY19yZWdzX3Jlc3RvcmUoc3Ry
dWN0IHN0bTMyZjdfaTJjX2RldiAqaTJjX2RldikKPiAgCXdyaXRlbF9yZWxheGVkKGJhY2t1cF9y
ZWdzLT5jcjIsIGkyY19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19DUjIpOwo+ICAJd3JpdGVsX3Jl
bGF4ZWQoYmFja3VwX3JlZ3MtPm9hcjEsIGkyY19kZXYtPmJhc2UgKyBTVE0zMkY3X0kyQ19PQVIx
KTsKPiAgCXdyaXRlbF9yZWxheGVkKGJhY2t1cF9yZWdzLT5vYXIyLCBpMmNfZGV2LT5iYXNlICsg
U1RNMzJGN19JMkNfT0FSMik7Cj4gLQl3cml0ZWxfcmVsYXhlZChiYWNrdXBfcmVncy0+cGVjciwg
aTJjX2Rldi0+YmFzZSArIFNUTTMyRjdfSTJDX1BFQ1IpOwo+ICAKPiAgCXBtX3J1bnRpbWVfcHV0
X3N5bmMoaTJjX2Rldi0+ZGV2KTsKPiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
