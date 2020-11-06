Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E50DE2A90EC
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 09:04:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D67AC3FAD4;
	Fri,  6 Nov 2020 08:04:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AA66C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 08:04:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A682F7A032216; Fri, 6 Nov 2020 09:03:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=BFclo2FGBrmma5l3xTXXe6blVOcgJkbIr97AGSjoRj8=;
 b=0cSDmd6H40d1kAnFIO+OCXo3Hv5vJa+VnHp2iGXfFGb0KCVMYK60IS9RQUuLDKof2l6l
 Pr9+gsGuqKFE6ly8XWmC/PUYPs0LHVcwshrm+bvSZh/ZDWVohepw1ZRHtacHemCsmnz5
 VsC75EVdyvYQMuWauCFJAmgaDv10aU6Y5yMMot212V4ZBZfk01GMuvNrhBNBiuEBUDh6
 UIy4uIkBzzBxmSYOoWRl+eQNnLGRj7huu8FbunFoWR83L1eZ2E8UPLU8hwzfsblWPMQf
 FjLGPGbIs7yEkl/uVps6W3GooUW+bGCrOaPpmb3CiIntRpHmMiTiIm35Q4POuH/aqOww rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrcrhd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 09:03:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D0EBC100038;
 Fri,  6 Nov 2020 09:03:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B646322ADBC;
 Fri,  6 Nov 2020 09:03:43 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 09:03:38 +0100
To: Badhri Jagan Sridharan <badhri@google.com>, Rob Herring <robh@kernel.org>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
 <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com>
 <20201104210803.GA4115079@bogus>
 <2da804ff-3b3c-0ea9-14d5-a163b28ccc33@st.com>
 <CAKgpwJU_yTTYabeMYFBqNs_6=N7gaTAc1v-+fU-dshFUrL1qVA@mail.gmail.com>
 <CAL_JsqJUVRRD=j6FTFUgUuhfLkGe5WRex+gj7N6wvu-DbwL+bA@mail.gmail.com>
 <CAPTae5JtpRS11FxsYE4wLFoM=fng__v8wEWMtyCJqiqrgS5SmA@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <e5c4718c-8468-3492-d4bd-a561c795cc89@st.com>
Date: Fri, 6 Nov 2020 09:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPTae5JtpRS11FxsYE4wLFoM=fng__v8wEWMtyCJqiqrgS5SmA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_02:2020-11-05,
 2020-11-06 signatures=0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS" <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jun Li <lijun.kernel@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

SGkgQmFkaHJpLAoKT24gMTEvNi8yMCA0OjEwIEFNLCBCYWRocmkgSmFnYW4gU3JpZGhhcmFuIHdy
b3RlOgo+IEhpIFJvYiBhbmQgQW1lbGllLAo+IAo+IFdpdGggcmVnYXJkcyB0byBkaXNjdXNzaW9u
cyBpbiB0aGlzIHRocmVhZCwKPiBGb3IgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMTAy
MDA5MzYyNy4yNTY4ODUtMi1iYWRocmlAZ29vZ2xlLmNvbSwKPiBJIGNhbiBzZW5kIGluIGEgcGF0
Y2ggdG8gdXBkYXRlIHRoZSBuZXctc291cmNlLWZycy10eXBlYy1jdXJyZW50IHByb3BlcnR5Lgo+
IEFtZWxpZSwgSWYgeW91IGFyZSBhbHJlYWR5IHBsYW5uaW5nIHRvIHNlbmQgdGhhdCBJIGFtIGZp
bmUgd2l0aCB0aGF0IGFzIHdlbGwuCj4gTGV0IG1lIGtub3cgIQo+IAo+IFRvIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBmb3IgbmV3LXNvdXJjZS1mcnMtdHlwZWMtY3VycmVudCB3b3VsZCBiZSwKPiAx
LiBSZW5hbWUgdG8gZnJzLW5ldy1zb3VyY2Utb3Btb2RlCj4gMi4gVXNlIHN0cmluZyB2YWx1ZXMg
aW5zdGVhZCBvZiB1MzIgc2ltaWxhciB0byB0eXBlYy1wb3dlci1vcG1vZGUuCj4gQXJlIHRoZXNl
IGNvcnJlY3QgPwoKCllvdSBjYW4gc2VuZCBwYXRjaGVzIHRvIHJlbmFtZSB0aGUgbmV3LXNvdXJj
ZS1mcnEtdHlwZWMtY3VycmVudCBwcm9wZXJ0eSAKaW50byBmcnMtbmV3LXNvdXJjZS1vcG1vZGUs
IGFuZCB1cGRhdGUgdGhlIHRjcG0gYXMgd2VsbC4gWW91IGNhbiB1c2UgdGhlIAp0eXBlY19maW5k
X3B3cl9vcG1vZGUoKSwgaXQgd2lsbCByZXR1cm4KZW51bSB0eXBlY19wd3Jfb3Btb2RlIHsKCVRZ
UEVDX1BXUl9NT0RFX1VTQiwKCVRZUEVDX1BXUl9NT0RFXzFfNUEsCglUWVBFQ19QV1JfTU9ERV8z
XzBBLAoJVFlQRUNfUFdSX01PREVfUEQsCn07ClRoZW4geW91IGhhdmUgdG8gdHJhbnNsYXRlIGl0
IGZvciBGUlMuCgpJJ2xsIHNlbmQgYSBuZXcgdmVyc2lvbiBvZiBteSBzZXJpZXMgdG8gZG9jdW1l
bnQgdHlwZWMtcG93ZXItb3Btb2RlIGFuZCAKdXBkYXRlIHN0dXNiMTYweCBkcml2ZXIgYW5kIHN0
bTMybXAxNXh4LWRreCBkZXZpY2UgdHJlZSBhY2NvcmRpbmdseS4KClRoYW5rcywKQW1lbGllCgo+
IAo+IFRoYW5rcywKPiBCYWRocmkKPiAKPiBPbiBUaHUsIE5vdiA1LCAyMDIwIGF0IDc6NTUgQU0g
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIFRodSwgTm92IDUs
IDIwMjAgYXQgNjoyNCBBTSBKdW4gTGkgPGxpanVuLmtlcm5lbEBnbWFpbC5jb20+IHdyb3RlOgo+
Pj4KPj4+IEFtZWxpZSBERUxBVU5BWSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4g5LqOMjAyMOW5
tDEx5pyINeaXpeWRqOWbmyDkuIvljYg3OjM25YaZ6YGT77yaCj4+Pj4KPj4+PiBPbiAxMS80LzIw
IDEwOjA4IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4gT24gRnJpLCBPY3QgMzAsIDIwMjAg
YXQgMDQ6Mjc6MTRQTSArMDEwMCwgQW1lbGllIERFTEFVTkFZIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+
Cj4+Pj4+PiBPbiAxMC8zMC8yMCAzOjI5IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4+PiBP
biBUaHUsIE9jdCAyOSwgMjAyMCBhdCAxMTo0OSBBTSBBbWVsaWUgREVMQVVOQVkgPGFtZWxpZS5k
ZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBPbiAxMC8yOS8yMCA0OjQwIFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4+Pj4+IE9uIFRo
dSwgT2N0IDI5LCAyMDIwIGF0IDEwOjU4OjAzQU0gKzAxMDAsIEFtZWxpZSBEZWxhdW5heSB3cm90
ZToKPj4+Pj4+Pj4+PiBQb3dlciBvcGVyYXRpb24gbW9kZSBtYXkgZGVwZW5kcyBvbiBoYXJkd2Fy
ZSBkZXNpZ24sIHNvLCBhZGQgdGhlIG9wdGlvbmFsCj4+Pj4+Pj4+Pj4gcHJvcGVydHkgcG93ZXIt
b3Btb2RlIGZvciB1c2ItYyBjb25uZWN0b3IgdG8gc2VsZWN0IHRoZSBwb3dlciBvcGVyYXRpb24K
Pj4+Pj4+Pj4+PiBtb2RlIGNhcGFiaWxpdHkuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+Cj4+Pj4+Pj4+
Pj4gLS0tCj4+Pj4+Pj4+Pj4gICAgICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0
b3IueWFtbCAgICAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+Pj4gICAgICAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNv
bm5lY3Rvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rv
ci91c2ItY29ubmVjdG9yLnlhbWwKPj4+Pj4+Pj4+PiBpbmRleCA3MjhmODJkYjA3M2QuLjIwMGQx
OWM2MGZkNSAxMDA2NDQKPj4+Pj4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+Pj4+Pj4+Pj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55
YW1sCj4+Pj4+Pj4+Pj4gQEAgLTkzLDYgKzkzLDI0IEBAIHByb3BlcnRpZXM6Cj4+Pj4+Pj4+Pj4g
ICAgICAgICAgICAtIGRldmljZQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgLSBkdWFsCj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+PiArICBwb3dlci1vcG1vZGU6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSd2ZSBh
Y2tlZCB0aGlzIHZlcnNpb246Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDIwMTAyMDA5MzYyNy4yNTY4ODUtMi1iYWRocmlAZ29vZ2xlLmNvbQo+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gZnJzIGlzIHVzZWQgZm9yIEZhc3QgUm9sZSBTd2FwIGRlZmlu
ZWQgaW4gVVNCIFBEIHNwZWMuCj4+Pj4+Pj4+IEkgdW5kZXJzdGFuZCBpdCBhbGxvd3MgdG8gZ2V0
IHRoZSBzYW1lIGluZm9ybWF0aW9uIGJ1dCBJJ20gd29uZGVyaW5nIHdoeQo+Pj4+Pj4+PiB0aGUg
cHJvcGVydHkgbmFtZSBpcyBsaW1pdGVkIHRvIC1mcnMtIGluIHRoaXMgY2FzZS4gV2hhdCBhYm91
dCBhCj4+Pj4+Pj4+IG5vbi1wb3dlciBkZWxpdmVyeSBVU0ItQyBjb25uZWN0b3IgPwo+Pj4+Pj4+
Cj4+Pj4+Pj4gSSd2ZSBnb3Qgbm8gaWRlYS4gVGhlIGZvbGtzIHRoYXQga25vdyBVU0ItQyBhbmQg
UEQgZGV0YWlscyBuZWVkIHRvIGdldAo+Pj4+Pj4+IHRvZ2V0aGVyIGFuZCB3b3JrIGFsbCB0aGlz
IG91dC4gVG8gbWUsIGl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgdGhpbmcuLi4KPj4+Pj4+Pgo+Pj4+
Pj4KPj4+Pj4+IEl0IGxvb2tzIGJ1dC4uLgo+Pj4+Pj4KPj4+Pj4+IFRoZSBwdXJwb3NlIG9mIHBv
d2VyLW9wbW9kZSBwcm9wZXJ0eSBpcyB0byBjb25maWd1cmUgdGhlIFVTQi1DIGNvbnRyb2xsZXJz
LAo+Pj4+Pj4gZXNwZWNpYWxseSB0aGUgbm9uLVBEIFVTQi1DIGNvbnRyb2xsZXJzIHRvIGRldGVy
bWluZSB0aGUgcG93ZXIgb3BlcmF0aW9uCj4+Pj4+PiBtb2RlIHRoYXQgdGhlIFR5cGUgQyBjb25u
ZWN0b3Igd2lsbCBzdXBwb3J0IGFuZCB3aWxsIGFkdmVydGlzZSB0aHJvdWdoIENDCj4+Pj4+PiBw
aW5zIHdoZW4gaXQgaGFzIG5vIHBvd2VyIGRlbGl2ZXJ5IHN1cHBvcnQsIHdoYXRldmVyIHRoZSBw
b3dlciByb2xlOiBTaW5rLAo+Pj4+Pj4gU291cmNlIG9yIER1YWwKPj4+Pj4+IFRoZSBtYW5hZ2Vt
ZW50IG9mIHRoZSBwcm9wZXJ0eSBpcyB0aGUgc2FtZSB0aGF0IGRhdGEtcm9sZSBhbmQgcG93ZXIt
cm9sZQo+Pj4+Pj4gcHJvcGVydGllcywgYW5kIGRvbmUgYnkgVVNCIFR5cGUtQyBDb25uZWN0b3Ig
Q2xhc3MuCj4+Pj4+Pgo+Pj4+Pj4gbmV3LXNvdXJjZS1mcnMtdHlwZWMtY3VycmVudCBzcGVjaWZp
ZXMgaW5pdGlhbCBjdXJyZW50IGNhcGFiaWxpdHkgb2YgdGhlIG5ldwo+Pj4+Pj4gc291cmNlIHdo
ZW4gdlNhZmU1ViBpcyBhcHBsaWVkIGR1cmluZyBQRDMuMCBGYXN0IFJvbGUgU3dhcC4gU28gaGVy
ZSwgdGhpcwo+Pj4+Pj4gcHJvcGVydHkgaXMgbm90IGFwcGxpZWQgYXQgdXNiLWMgY29udHJvbGxl
ciBjb25maWd1cmF0aW9uIGxldmVsLCBidXQgZHVyaW5nCj4+Pj4+PiBQRCBGYXN0IFJvbGUgU3dh
cCwgc28gd2hlbiB0aGUgU2luayBiZWNvbWUgdGhlIFNvdXJjZS4KPj4+Pj4+IE1vcmVvdmVyLCB0
aGUgcmVsYXRlZCBkcml2ZXIgY29kZSBzYXlzIEZSUyBjYW4gb25seSBiZSBzdXBwb3J0ZWQgYnkg
RFJQCj4+Pj4+PiBwb3J0cy4gU28gbmV3LXNvdXJjZS1mcnMtdHlwZWMtY3VycmVudCBwcm9wZXJ0
eSwgaW4gYWRkaXRpb24gdG8gYmVpbmcKPj4+Pj4+IHNwZWNpZmljIHRvIFBELCBpcyBhbHNvIGRl
ZGljYXRlZCB0byBEUlAgdXNiLWMgY29udHJvbGxlci4KPj4+Pj4+IFRoZSBwcm9wZXJ0eSBpcyBt
YW5hZ2VkIGJ5IFR5cGUtQyBQb3J0IENvbnRyb2xsZXIgTWFuYWdlciBmb3IgUEQuCj4+Pj4+Cj4+
Pj4+IEJ1dCBpdCdzIHRoZSBzYW1lIHNldCBvZiBwb3NzaWJsZSB2YWx1ZXMsIHJpZ2h0PyBTbyB3
ZSBjYW4gYWxpZ24gdGhlCj4+Pj4+IHZhbHVlcyBhdCBsZWFzdC4KPj4+Pj4KPj4+Pgo+Pj4+IFVT
QiBQb3dlciBEZWxpdmVyeSBGUlMgdmFsdWVzIGFyZSBkZWZpbmVkIGluCj4+Pj4gaW5jbHVkZS9k
dC1iaW5kaW5ncy91c2IvcGQuaAo+Pj4KPj4+IEkgdGhpbmsgdGhpcyBjYW4gYmUgY2hhbmdlZCBp
ZiBib3RoIGNhbiBiZSBhbGlnbmVkLgo+Pj4KPj4+PiB0byBmaXQgd2l0aCBkcml2ZXJzL3VzYi90
eXBlYy90Y3BtL3RjcG0uYwo+Pj4+IGZyc190eXBlY19jdXJyZW50IGVudW0uCj4+Pj4KPj4+PiBV
U0ItQyBwb3dlciBvcGVyYXRpb24gbW9kZSB2YWx1ZXMgYXJlIGRlZmluZWQgaW4KPj4+PiBpbmNs
dWRlL2xpbnV4L3VzYi90eXBlYy5oIHdpdGggdHlwZWNfcHdyX29wbW9kZSBlbnVtIGFuZCBtYXRj
aGluZyB3aXRoCj4+Pj4gc3RyaW5nIHZhbHVlcyBvZiB0eXBlY19wd3Jfb3Btb2RlcyB0YWIuCj4+
Pj4KPj4+PiBVU0IgUEQgcmVxdWlyZXMgVVNCLUMuCj4+Pj4gVVNCLUMgZG9lc24ndCByZXF1aXJl
cyBVU0IgUEQuCj4+Pj4KPj4+PiBkcml2ZXJzL3VzYi90eXBlYy90Y3BtL3RjcG0uYyBhbHJlYWR5
IHVzZWQgdHlwZWNfcHdyX29wbW9kZSB2YWx1ZXMuCj4+Pj4KPj4+PiBVU0IgUEQgc3BlY2lmaWNh
dGlvbiBUYWJsZSA2LTE0IEZpeGVkIFN1cHBseSBQRE8gc2F5czoKPj4+PiBGYXN0IFJvbGUgU3dh
cCByZXF1aXJlZCBVU0IgVHlwZS1DIEN1cnJlbnQgKHNlZSBhbHNvIFtVU0IgVHlwZS1DIDIuMF0p
Ogo+Pj4+IFZhbHVlIHwgRGVzY3JpcHRpb24KPj4+PiAgICAwMGIgIHwgRmFzdCBTd2FwIG5vdCBz
dXBwb3J0ZWQgKGRlZmF1bHQpCj4+Pj4gICAgMDFiICB8IERlZmF1bHQgVVNCIFBvd2VyCj4+Pj4g
ICAgMTBiICB8IDEuNUEgQCA1Vgo+Pj4+ICAgIDExYiAgfCAzLjBBIEAgNVYKPj4+Cj4+PiBUaGlz
IGlzIHRoZSB2YWx1ZSBpbiBQRE8gb2Ygc2luaywgdGhlIEZSUyBwcm9wZXJ0eSB2YWx1ZShvciBh
ZnRlciB0cmFuc2xhdGVkKQo+Pj4gYWN0dWFsbHkgaXMgdXNlZCB0byBjb21wYXJlIHdpdGggYWJv
dmUgdmFsdWUuCj4+Pgo+Pj4gU28gSSB0aGluayBib3RoIHByb3BlcnRpZXMgY2FuIHNoYXJlIHRo
ZSBzYW1lICJ2YWx1ZSIsIG1heWJlIHN0cmluZwo+Pj4gbGlrZSBiZWxvdwo+Pj4KPj4+ICAgIDEw
IHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgdHlwZWNfcHdyX29wbW9kZXNbXSA9IHsKPj4+ICAg
IDExICAgICAgICAgW1RZUEVDX1BXUl9NT0RFX1VTQl0gICAgPSAiZGVmYXVsdCIsCj4+PiAgICAx
MiAgICAgICAgIFtUWVBFQ19QV1JfTU9ERV8xXzVBXSAgID0gIjEuNUEiLAo+Pj4gICAgMTMgICAg
ICAgICBbVFlQRUNfUFdSX01PREVfM18wQV0gICA9ICIzLjBBIiwKPj4+Cj4+Pj4KPj4+PiBOb3Rl
IHRoZSAqc2VlIGFsc28gVVNCIFR5cGUtQyAyLjAqLgo+Pj4+Cj4+Pj4gVVNCIFR5cGUtQyBzcGVj
aWZpY2F0aW9uIDQuNi4yLjEgVVNCIFR5cGUtQyBDdXJyZW50IHNheXM6Cj4+Pj4gVGhlIFVTQiBU
eXBlLUMgY29ubmVjdG9yIHVzZXMgQ0MgcGlucyBmb3IgY29uZmlndXJhdGlvbiBpbmNsdWRpbmcg
YW4KPj4+PiBhYmlsaXR5IGZvciBhIFNvdXJjZSB0byBhZHZlcnRpc2UgdG8gaXRzIHBvcnQgcGFy
dG5lciAoU2luaykgdGhlIGFtb3VudAo+Pj4+IG9mIGN1cnJlbnQgaXQgc2hhbGwgc3VwcGx5Ogo+
Pj4+IOKAoiBEZWZhdWx0IGlzIHRoZSBhcy1jb25maWd1cmVkIGZvciBoaWdoLXBvd2VyIG9wZXJh
dGlvbiBjdXJyZW50IHZhbHVlIGFzCj4+Pj4gZGVmaW5lZCBieSB0aGUgVVNCIFNwZWNpZmljYXRp
b24gKDUwMCBtQSBmb3IgVVNCIDIuMCBwb3J0czsgOTAwIG1BIG9yCj4+Pj4gMSw1MDAgbUEgZm9y
IFVTQiAzLjIgcG9ydHMgaW4gc2luZ2xlLWxhbmUgb3IgZHVhbC1sYW5lIG9wZXJhdGlvbiwKPj4+
PiByZXNwZWN0aXZlbHkpCj4+Pj4g4oCiIDEuNSBBCj4+Pj4g4oCiIDMuMCBBCj4+Pj4KPj4+Pj4g
Q2FuIHdlIGFsaWduIHRoZSBuYW1lcyBpbiBzb21lIHdheT8gcG93ZXItb3Btb2RlIGFuZCBmcnMt
c291cmNlLW9wbW9kZQo+Pj4+PiBvciA/Pwo+Pj4KPj4+IGhvdyBhYm91dCB0eXBlYy1wb3dlci1v
cG1vZGUgYW5kIGZycy1uZXctc291cmNlLW9wbW9kZQo+Pgo+PiBTdXJlLgo+Pgo+Pj4KPj4+Pj4K
Pj4+Pgo+Pj4+IEkgbGV0IFVTQiBQRCBzcGVjaWFsaXN0cyBhbnN3ZXIuCj4+Pj4KPj4+PiAqZnJz
KiBwcm9wZXJ0eSBmaXRzIHdpdGggVVNCIFBEIHNwZWNpZmljYXRpb24sIHNvIHdpdGggVVNCIFBE
IHByb3RvY29sLgo+Pj4+ICpwb3dlci1vcG1vZGUgZml0cyB3aXRoIFVTQiBUeXBlLUMgc3BlY2lm
aWNhdGlvbiwgc28gd2l0aCBVU0ItQyBoYXJkd2FyZQo+Pj4+IHN1cHBvcnQuCj4+Pj4KPj4+Pj4g
QXJlIHRoZXNlIDIgcHJvcGVydGllcyBtdXR1YWxseSBleGNsdXNpdmU/Cj4+Pgo+Pj4gSSB0aGlu
ayB5ZXMuCj4+Cj4+IFRoaXMgc2hvdWxkIHdvcmsgdG8gZXhwcmVzcyB0aGF0Ogo+Pgo+PiBhbGxP
ZjoKPj4gICAgLSBub3Q6Cj4+ICAgICAgICByZXF1aXJlZDoKPj4gICAgICAgICAgLSB0eXBlYy1w
b3dlci1vcG1vZGUKPj4gICAgICAgICAgLSBmcnMtbmV3LXNvdXJjZS1vcG1vZGUKPj4KPj4gUm9i
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
