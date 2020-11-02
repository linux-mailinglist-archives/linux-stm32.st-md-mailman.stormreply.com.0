Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4052A2B2A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 14:03:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B164C36B35;
	Mon,  2 Nov 2020 13:03:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B089C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 13:03:47 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A2CvYmv026396; Mon, 2 Nov 2020 14:03:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=+ZrQjtUe6yyGc+B5Q/7nA7/Qdtz+Qxl9dd9955IrPWk=;
 b=UWlD/IPQuhydAx63xiBjlUOWRlOawRZbnBSl8+4iDWarP27STfmSi+NJiMMIINZRXApk
 7wAridCFnjdqRoyKpmjTqHvrBWZh5j0zwBp01Ji7MugMimCDZXC+Ik0OlHR3KFsTDcXZ
 W1oend13udBhARUOQxm0EX7Ko8EzCRBfT0XPNOeyDBt8o1AHpkjVyWrSwVNviQH8nTCv
 WsDGpSq+65sLl0pZNC+89tJbkqMS2DjcRbkZCQxec8uXaU5HnWqD07IAmD/CL3q2kdqd
 uv0lZQ93XwNRd2wx19iMBJ4IHeeuzzZIVg01G+BDBCdvjtpbPK+6/aQL6CRpvXLHnDFp mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw124c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Nov 2020 14:03:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 431A010002A;
 Mon,  2 Nov 2020 14:03:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1AEBF210534;
 Mon,  2 Nov 2020 14:03:23 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 14:03:22 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Marek Vasut <marex@denx.de>, Arnd
 Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman
 <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Marcin Sloniewski
 <marcin.sloniewski@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>
References: <4ac236b3-b980-f653-f644-53e586570724@st.com>
 <4bb5d090-df39-8d58-808f-1fe33c54de14@pengutronix.de>
 <10efa774-946d-b02d-2d0c-37d451cb3ccd@denx.de>
 <61a89fe2-639d-32b9-be66-9f51b73d579f@pengutronix.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6889e344-00b7-9b1c-8048-e9c5adaf53c6@st.com>
Date: Mon, 2 Nov 2020 14:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <61a89fe2-639d-32b9-be66-9f51b73d579f@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-02_07:2020-11-02,
 2020-11-02 signatures=0
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.10 #1
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

SGkgZ3V5cwoKT24gMTEvMi8yMCAxOjUyIFBNLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4gSGVsbG8g
TWFyZWssCj4gCj4gT24gMTAvMzAvMjAgMTA6MDQgQU0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBP
biAxMC8yOC8yMCA2OjM4IFBNLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4+PiBIZWxsbyBBbGV4LAo+
Pgo+PiBIaSwKPj4KPj4+IE9uIDEwLzI4LzIwIDQ6MjggUE0sIEFsZXhhbmRyZSBUb3JndWUgd3Jv
dGU6Cj4+Pj4gSGkgQXJuZCwgT2xvZiBhbmQgS2V2aW4sCj4+Pj4KPj4+PiBPbiB2NS4xMC1yYzEg
U1RNMzIgYm9hcmRzIGNhbm5vdCBib290LiBJdCBpcyBsaW5rZWQgdG8gYSBjaGFuZ2UgaW4gcmVn
dWxhdG9yIGZyYW1ld29yayB3aGljaCBoaWdobGlnaHRzIHRoYXQgb3VyIHN1cHBsaWVzIGFyZSBu
b3Qgd2VsbCBkZXNjcmliZWQuIFRoaXMgUFIgZml4ZXMgaXQgZm9yIFNUTTMyIGJvYXJkcyB0aGF0
IEkgaGF2ZSBvbiBteSBkZXNrOiBFRDEgYW5kIERLeC4KPj4+Cj4+PiBXaGljaCBjaGFuZ2UgdHJp
Z2dlcmVkIHRoZSByZWdyZXNzaW9uPwo+Pgo+PiBJIHRoaW5rIGl0IG1pZ2h0IGJlOgo+PiBhZWE2
Y2I5OTcwM2UgKCJyZWd1bGF0b3I6IHJlc29sdmUgc3VwcGx5IGFmdGVyIGNyZWF0aW5nIHJlZ3Vs
YXRvciIpCj4+IHdoaWNoIGxhbmRlZCBpbiA1LjQuNzMgYXMKPj4gMDEyMGVjMzJhNzc3ICgicmVn
dWxhdG9yOiByZXNvbHZlIHN1cHBseSBhZnRlciBjcmVhdGluZyByZWd1bGF0b3IiKQo+IAo+IFRo
YW5rcy4gSSBqdXN0IHJlcGxpZWQgKHdpdGggYSBDQyB0byB0aGUgTUwgaGVyZSkgdG8gYW5vdGhl
ciB0aHJlYWQKPiByZXBvcnRpbmcgaXNzdWVzIHRvIHRoZSBhdXRob3IncyBwYXRjaC4KClRoYW5r
cyBBaG1hZAoKPiAKPj4KPj4+PiBJIGFzc3VtZSB0aGF0IHNhbWUgcGF0Y2ggaGFzIHRvIGJlIGRv
bmUgZm9yIG90aGVyIFNUTTMyIGJvYXJkcywgYnV0IGFzIEkgZG9uJ3QgaGF2ZSBzY2hlbWF0aWNz
IEkgY2FuJ3QgcHJvdmlkZSBpdC4gU28gYSByb3VuZDIgaGFzIHRvIGJlIGRvbmUgZm9yOgo+Pj4+
IC0gc3Rpbmdlcjk2Cj4+Pj4gLSBNQy0xCj4+Pj4gLSBPZHlzc2V5IFNPTQo+Pj4+IC0gREhDT1Ig
L0RIQ09NCj4+Pj4KPj4+PiBNYW5pLCBNYXJlaywgQWhtYWQsIE1hcmNpbiBjYW4geW91IHBsZWFz
ZSBoYXZlIGEgbG9vayBvbiBpdCBhbmQgcHJvdmlkZSBwYXRjaGVzICh0aGVuIEknbGwgcHJvdmlk
ZSByb3VuZDIpLiBUaGFua3MgaW4gYWR2YW5jZS4KPj4+Cj4+PiBZb3VyIGNoYW5nZSBkb2Vzbid0
IGxvb2sgcmlnaHQuIElmIEkgc2V0IHZyZWZfZGRyLXN1cHBseSB0byBhIGZpeGVkIHJlZ3VsYXRv
ciwKPj4+IHRoZSBNQy0xIG5vdyBib290cyBhZ2FpbiBhcyB3ZWxsLCBidXQgdGhhdCBzZWVtcyB0
byBqdXN0IG1hc2sgdGhlIHJlYWwgaXNzdWU6Cj4+Pgo+Pj4gIMKgIC0gdnJlZl9kZHIgaXMgYW4g
X291dHB1dF8gb2YgdGhlIFBNSUMsIHdoeSBzaG91bGQgb25lIGhhdmUgdG8gc3BlY2lmeSBhIHN1
cHBseSBmb3IgaXQ/Cj4+Pgo+Pj4gIMKgIC0gVGhpcyBpcyBhY3R1YWxseSBpbmNvbXBhdGlibGUg
d2l0aCB0aGUgYmluZGluZy4gdnJlZl9kZHItc3VwcGx5IGlzbid0IHNwZWNpZmllZAo+Pj4gIMKg
wqDCoCBhcyBhbiBhbGxvd2VkIHByb3BlcnR5IChub3QgdG8gbWVudGlvbiBhIHJlcXVpcmVkIG9u
ZSkKPj4+Cj4+PiAgwqAgLSBJc24ndCB0aGUga2VybmVsIHN1cHBvc2VkIHRvIHN0YXkgY29tcGF0
aWJsZSB0byBvbGQgZGV2aWNlIHRyZWVzPwo+Pj4KPj4+IEkgdGhpbmsgdGhlIHN0cG1pYyBkcml2
ZXIgaXMgYXQgZmF1bHQgaGVyZSBhbmQgdGhhdCB0aGUgcmVndWxhdG9yIGZyYW1ld29yayBjaGFu
Z2UganVzdAo+Pj4gbWFkZSB0aGF0IGFwcGFyZW50Lgo+Pgo+PiBJIGFncmVlIHVwZGF0aW5nIHRo
ZSBEVCBpcyBub3QgdGhlIHJpZ2h0IGFwcHJvYWNoLgo+Pgo+IAoKSSBhZ3JlZSB3aXRoIHlvdS4g
UmVndWxhdG9yIGZyYW1ld29yayBjaGFuZ2Ugc2hvdWxkIG5vdCBpbXBvc2UgYSBjaGFuZ2UgCmlu
IERUIChleGNlcHQgaWYgaXQgZXhwbGljaXRseSBtZW50aW9uZWQgaW4gYmluZGluZyBkb2N1bWVu
dGF0aW9uKS4gQXMgSSAKZXhwbGFpbmVkIHRvIE1hcmVrIHRoaXMgbW9ybmluZywgSSBoYWQgdGhp
cyBwYXRjaCBpbiBteSBiYWNrbG9nLCBhbmQgaXQgCmFsbG93cyB0byBib290IFNUTTMyIERLL0VW
IGJvYXJkcyBmb3IgcmMgY3ljbGUuCgpOb3csIGxldCdzIGhhdmUgb24gInJlZ3VsYXRvcjogcmVz
b2x2ZSBzdXBwbHkgYWZ0ZXIgY3JlYXRpbmcgcmVndWxhdG9yIi4KCi0tLS0tCnJldCA9IHNldF9t
YWNoaW5lX2NvbnN0cmFpbnRzKHJkZXYsIGNvbnN0cmFpbnRzKTsKaWYgKHJldCA9PSAtRVBST0JF
X0RFRkVSKSB7CgkvKiBSZWd1bGF0b3IgbWlnaHQgYmUgaW4gYnlwYXNzIG1vZGUgYW5kIHNvIG5l
ZWRzIGl0cyBzdXBwbHkKCSAqIHRvIHNldCB0aGUgY29uc3RyYWludHMgKi8KCS8qIEZJWE1FOiB0
aGlzIGN1cnJlbnRseSB0cmlnZ2VycyBhIGNoaWNrZW4tYW5kLWVnZyBwcm9ibGVtCgkgKiB3aGVu
IGNyZWF0aW5nIC1TVVBQTFkgc3ltbGluayBpbiBzeXNmcyB0byBhIHJlZ3VsYXRvcgoJICogdGhh
dCBpcyBqdXN0IGJlaW5nIGNyZWF0ZWQgKi8KCXJldCA9IHJlZ3VsYXRvcl9yZXNvbHZlX3N1cHBs
eShyZGV2KTsKCWlmICghcmV0KQoJCXJldCA9IHNldF9tYWNoaW5lX2NvbnN0cmFpbnRzKHJkZXYs
IGNvbnN0cmFpbnRzKTsKCWVsc2UKCQlyZGV2X2RiZyhyZGV2LCAidW5hYmxlIHRvIHJlc29sdmUg
c3VwcGx5IGVhcmx5OiAlcGVcbiIsCgkJCSBFUlJfUFRSKHJldCkpOwoJfQppZiAocmV0IDwgMCkK
CWdvdG8gd2FzaDsKLS0tLS0KCgotLT4gcmVndWxhdG9yX3Jlc29sdmVfc3VwcGx5KHJkZXYpOyBp
cyBubyBsb25nZXIgY2FsbGVkIHdoaWNoIHNlZW1zIHRvIApiZSB0aGUgc3RhcnRpbmcgcG9pbnQg
b2Ygb3VyIGlzc3VlLgpOb3RlIHRoYXQgdGhlICJGSVhNRSIgY29tbWVudCBjb3VsZCBhIGNsdWUu
CgpjaGVlcnMKYWxleAoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
