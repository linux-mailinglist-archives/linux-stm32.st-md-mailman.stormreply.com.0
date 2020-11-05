Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD072A8202
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 16:18:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2270C3FAD4;
	Thu,  5 Nov 2020 15:18:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C109C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 15:18:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5FC054015665; Thu, 5 Nov 2020 16:17:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=6CQ7fh91CfjTVJ2jXisAjtxUWP6/xftaixySWIC6ubE=;
 b=hAP/dltXKJCmvCzKuf4+tbju0mz5azJADpxhctJs6A0HuSv2RJFDKZF7eO2irqeDeCpO
 pkh/dQXWtfiB1me8Iy7wKgOVb08TAuwcO6+pcpogcNnAZCDnjexlcHj6GI9Zv0rN8APJ
 lo5/g/Pl+Z5YCy6nRKYYN5ckMyyRAHG8eZMJZ/2XxArjWqH5ILFaIJEvdfx6RgZ1IC96
 ze1bWQpeOXM0CVkcDQ3TmOa/+rUABN5fFVElo72uv5cOnWB4OI5zvR0fYHaMe5tX5G5H
 DrT0Oc3MFQOaCn5JQfK5DsLAzIBPQnj8hlgD1vddQlaZHoZO7vHpqki6fw0GKzI65wby 9A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00epv8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 16:17:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4025510002A;
 Thu,  5 Nov 2020 16:17:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 238252ADA1B;
 Thu,  5 Nov 2020 16:17:44 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 16:17:42 +0100
To: Jun Li <lijun.kernel@gmail.com>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
 <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com>
 <20201104210803.GA4115079@bogus>
 <2da804ff-3b3c-0ea9-14d5-a163b28ccc33@st.com>
 <CAKgpwJU_yTTYabeMYFBqNs_6=N7gaTAc1v-+fU-dshFUrL1qVA@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <05a69d4c-f78f-4f3f-ff8b-34e9dbe38519@st.com>
Date: Thu, 5 Nov 2020 16:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKgpwJU_yTTYabeMYFBqNs_6=N7gaTAc1v-+fU-dshFUrL1qVA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_09:2020-11-05,
 2020-11-05 signatures=0
Cc: Rob Herring <robh@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

T24gMTEvNS8yMCAxOjIzIFBNLCBKdW4gTGkgd3JvdGU6Cj4gQW1lbGllIERFTEFVTkFZIDxhbWVs
aWUuZGVsYXVuYXlAc3QuY29tPiDkuo4yMDIw5bm0MTHmnIg15pel5ZGo5ZubIOS4i+WNiDc6Mzbl
hpnpgZPvvJoKPj4KPj4gT24gMTEvNC8yMCAxMDowOCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+
PiBPbiBGcmksIE9jdCAzMCwgMjAyMCBhdCAwNDoyNzoxNFBNICswMTAwLCBBbWVsaWUgREVMQVVO
QVkgd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+IE9uIDEwLzMwLzIwIDM6MjkgUE0sIFJvYiBIZXJyaW5n
IHdyb3RlOgo+Pj4+PiBPbiBUaHUsIE9jdCAyOSwgMjAyMCBhdCAxMTo0OSBBTSBBbWVsaWUgREVM
QVVOQVkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4gT24gMTAvMjkvMjAgNDo0MCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4+Pj4g
T24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMTA6NTg6MDNBTSArMDEwMCwgQW1lbGllIERlbGF1bmF5
IHdyb3RlOgo+Pj4+Pj4+PiBQb3dlciBvcGVyYXRpb24gbW9kZSBtYXkgZGVwZW5kcyBvbiBoYXJk
d2FyZSBkZXNpZ24sIHNvLCBhZGQgdGhlIG9wdGlvbmFsCj4+Pj4+Pj4+IHByb3BlcnR5IHBvd2Vy
LW9wbW9kZSBmb3IgdXNiLWMgY29ubmVjdG9yIHRvIHNlbGVjdCB0aGUgcG93ZXIgb3BlcmF0aW9u
Cj4+Pj4+Pj4+IG1vZGUgY2FwYWJpbGl0eS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+Pj4+Pj4+PiAtLS0K
Pj4+Pj4+Pj4gICAgICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCAg
ICAgIHwgMTggKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9y
LnlhbWwKPj4+Pj4+Pj4gaW5kZXggNzI4ZjgyZGIwNzNkLi4yMDBkMTljNjBmZDUgMTAwNjQ0Cj4+
Pj4+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3Iv
dXNiLWNvbm5lY3Rvci55YW1sCj4+Pj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4+Pj4+Pj4+IEBAIC05Myw2
ICs5MywyNCBAQCBwcm9wZXJ0aWVzOgo+Pj4+Pj4+PiAgICAgICAgICAgIC0gZGV2aWNlCj4+Pj4+
Pj4+ICAgICAgICAgICAgLSBkdWFsCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICsgIHBvd2VyLW9wbW9kZToK
Pj4+Pj4+Pgo+Pj4+Pj4+IEkndmUgYWNrZWQgdGhpcyB2ZXJzaW9uOgo+Pj4+Pj4+Cj4+Pj4+Pj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMTAyMDA5MzYyNy4yNTY4ODUtMi1iYWRocmlA
Z29vZ2xlLmNvbQo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gZnJzIGlzIHVzZWQgZm9yIEZhc3QgUm9s
ZSBTd2FwIGRlZmluZWQgaW4gVVNCIFBEIHNwZWMuCj4+Pj4+PiBJIHVuZGVyc3RhbmQgaXQgYWxs
b3dzIHRvIGdldCB0aGUgc2FtZSBpbmZvcm1hdGlvbiBidXQgSSdtIHdvbmRlcmluZyB3aHkKPj4+
Pj4+IHRoZSBwcm9wZXJ0eSBuYW1lIGlzIGxpbWl0ZWQgdG8gLWZycy0gaW4gdGhpcyBjYXNlLiBX
aGF0IGFib3V0IGEKPj4+Pj4+IG5vbi1wb3dlciBkZWxpdmVyeSBVU0ItQyBjb25uZWN0b3IgPwo+
Pj4+Pgo+Pj4+PiBJJ3ZlIGdvdCBubyBpZGVhLiBUaGUgZm9sa3MgdGhhdCBrbm93IFVTQi1DIGFu
ZCBQRCBkZXRhaWxzIG5lZWQgdG8gZ2V0Cj4+Pj4+IHRvZ2V0aGVyIGFuZCB3b3JrIGFsbCB0aGlz
IG91dC4gVG8gbWUsIGl0IGxvb2tzIGxpa2UgdGhlIHNhbWUgdGhpbmcuLi4KPj4+Pj4KPj4+Pgo+
Pj4+IEl0IGxvb2tzIGJ1dC4uLgo+Pj4+Cj4+Pj4gVGhlIHB1cnBvc2Ugb2YgcG93ZXItb3Btb2Rl
IHByb3BlcnR5IGlzIHRvIGNvbmZpZ3VyZSB0aGUgVVNCLUMgY29udHJvbGxlcnMsCj4+Pj4gZXNw
ZWNpYWxseSB0aGUgbm9uLVBEIFVTQi1DIGNvbnRyb2xsZXJzIHRvIGRldGVybWluZSB0aGUgcG93
ZXIgb3BlcmF0aW9uCj4+Pj4gbW9kZSB0aGF0IHRoZSBUeXBlIEMgY29ubmVjdG9yIHdpbGwgc3Vw
cG9ydCBhbmQgd2lsbCBhZHZlcnRpc2UgdGhyb3VnaCBDQwo+Pj4+IHBpbnMgd2hlbiBpdCBoYXMg
bm8gcG93ZXIgZGVsaXZlcnkgc3VwcG9ydCwgd2hhdGV2ZXIgdGhlIHBvd2VyIHJvbGU6IFNpbmss
Cj4+Pj4gU291cmNlIG9yIER1YWwKPj4+PiBUaGUgbWFuYWdlbWVudCBvZiB0aGUgcHJvcGVydHkg
aXMgdGhlIHNhbWUgdGhhdCBkYXRhLXJvbGUgYW5kIHBvd2VyLXJvbGUKPj4+PiBwcm9wZXJ0aWVz
LCBhbmQgZG9uZSBieSBVU0IgVHlwZS1DIENvbm5lY3RvciBDbGFzcy4KPj4+Pgo+Pj4+IG5ldy1z
b3VyY2UtZnJzLXR5cGVjLWN1cnJlbnQgc3BlY2lmaWVzIGluaXRpYWwgY3VycmVudCBjYXBhYmls
aXR5IG9mIHRoZSBuZXcKPj4+PiBzb3VyY2Ugd2hlbiB2U2FmZTVWIGlzIGFwcGxpZWQgZHVyaW5n
IFBEMy4wIEZhc3QgUm9sZSBTd2FwLiBTbyBoZXJlLCB0aGlzCj4+Pj4gcHJvcGVydHkgaXMgbm90
IGFwcGxpZWQgYXQgdXNiLWMgY29udHJvbGxlciBjb25maWd1cmF0aW9uIGxldmVsLCBidXQgZHVy
aW5nCj4+Pj4gUEQgRmFzdCBSb2xlIFN3YXAsIHNvIHdoZW4gdGhlIFNpbmsgYmVjb21lIHRoZSBT
b3VyY2UuCj4+Pj4gTW9yZW92ZXIsIHRoZSByZWxhdGVkIGRyaXZlciBjb2RlIHNheXMgRlJTIGNh
biBvbmx5IGJlIHN1cHBvcnRlZCBieSBEUlAKPj4+PiBwb3J0cy4gU28gbmV3LXNvdXJjZS1mcnMt
dHlwZWMtY3VycmVudCBwcm9wZXJ0eSwgaW4gYWRkaXRpb24gdG8gYmVpbmcKPj4+PiBzcGVjaWZp
YyB0byBQRCwgaXMgYWxzbyBkZWRpY2F0ZWQgdG8gRFJQIHVzYi1jIGNvbnRyb2xsZXIuCj4+Pj4g
VGhlIHByb3BlcnR5IGlzIG1hbmFnZWQgYnkgVHlwZS1DIFBvcnQgQ29udHJvbGxlciBNYW5hZ2Vy
IGZvciBQRC4KPj4+Cj4+PiBCdXQgaXQncyB0aGUgc2FtZSBzZXQgb2YgcG9zc2libGUgdmFsdWVz
LCByaWdodD8gU28gd2UgY2FuIGFsaWduIHRoZQo+Pj4gdmFsdWVzIGF0IGxlYXN0Lgo+Pj4KPj4K
Pj4gVVNCIFBvd2VyIERlbGl2ZXJ5IEZSUyB2YWx1ZXMgYXJlIGRlZmluZWQgaW4KPj4gaW5jbHVk
ZS9kdC1iaW5kaW5ncy91c2IvcGQuaAo+IAo+IEkgdGhpbmsgdGhpcyBjYW4gYmUgY2hhbmdlZCBp
ZiBib3RoIGNhbiBiZSBhbGlnbmVkLgo+IAo+PiB0byBmaXQgd2l0aCBkcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcG0uYwo+PiBmcnNfdHlwZWNfY3VycmVudCBlbnVtLgo+Pgo+PiBVU0ItQyBwb3dl
ciBvcGVyYXRpb24gbW9kZSB2YWx1ZXMgYXJlIGRlZmluZWQgaW4KPj4gaW5jbHVkZS9saW51eC91
c2IvdHlwZWMuaCB3aXRoIHR5cGVjX3B3cl9vcG1vZGUgZW51bSBhbmQgbWF0Y2hpbmcgd2l0aAo+
PiBzdHJpbmcgdmFsdWVzIG9mIHR5cGVjX3B3cl9vcG1vZGVzIHRhYi4KPj4KPj4gVVNCIFBEIHJl
cXVpcmVzIFVTQi1DLgo+PiBVU0ItQyBkb2Vzbid0IHJlcXVpcmVzIFVTQiBQRC4KPj4KPj4gZHJp
dmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMgYWxyZWFkeSB1c2VkIHR5cGVjX3B3cl9vcG1vZGUg
dmFsdWVzLgo+Pgo+PiBVU0IgUEQgc3BlY2lmaWNhdGlvbiBUYWJsZSA2LTE0IEZpeGVkIFN1cHBs
eSBQRE8gc2F5czoKPj4gRmFzdCBSb2xlIFN3YXAgcmVxdWlyZWQgVVNCIFR5cGUtQyBDdXJyZW50
IChzZWUgYWxzbyBbVVNCIFR5cGUtQyAyLjBdKToKPj4gVmFsdWUgfCBEZXNjcmlwdGlvbgo+PiAg
ICAwMGIgIHwgRmFzdCBTd2FwIG5vdCBzdXBwb3J0ZWQgKGRlZmF1bHQpCj4+ICAgIDAxYiAgfCBE
ZWZhdWx0IFVTQiBQb3dlcgo+PiAgICAxMGIgIHwgMS41QSBAIDVWCj4+ICAgIDExYiAgfCAzLjBB
IEAgNVYKPiAKPiBUaGlzIGlzIHRoZSB2YWx1ZSBpbiBQRE8gb2Ygc2luaywgdGhlIEZSUyBwcm9w
ZXJ0eSB2YWx1ZShvciBhZnRlciB0cmFuc2xhdGVkKQo+IGFjdHVhbGx5IGlzIHVzZWQgdG8gY29t
cGFyZSB3aXRoIGFib3ZlIHZhbHVlLgo+IAo+IFNvIEkgdGhpbmsgYm90aCBwcm9wZXJ0aWVzIGNh
biBzaGFyZSB0aGUgc2FtZSAidmFsdWUiLCBtYXliZSBzdHJpbmcKPiBsaWtlIGJlbG93Cj4gCj4g
ICAgMTAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0eXBlY19wd3Jfb3Btb2Rlc1tdID0gewo+
ICAgIDExICAgICAgICAgW1RZUEVDX1BXUl9NT0RFX1VTQl0gICAgPSAiZGVmYXVsdCIsCj4gICAg
MTIgICAgICAgICBbVFlQRUNfUFdSX01PREVfMV81QV0gICA9ICIxLjVBIiwKPiAgICAxMyAgICAg
ICAgIFtUWVBFQ19QV1JfTU9ERV8zXzBBXSAgID0gIjMuMEEiLAo+IAo+Pgo+PiBOb3RlIHRoZSAq
c2VlIGFsc28gVVNCIFR5cGUtQyAyLjAqLgo+Pgo+PiBVU0IgVHlwZS1DIHNwZWNpZmljYXRpb24g
NC42LjIuMSBVU0IgVHlwZS1DIEN1cnJlbnQgc2F5czoKPj4gVGhlIFVTQiBUeXBlLUMgY29ubmVj
dG9yIHVzZXMgQ0MgcGlucyBmb3IgY29uZmlndXJhdGlvbiBpbmNsdWRpbmcgYW4KPj4gYWJpbGl0
eSBmb3IgYSBTb3VyY2UgdG8gYWR2ZXJ0aXNlIHRvIGl0cyBwb3J0IHBhcnRuZXIgKFNpbmspIHRo
ZSBhbW91bnQKPj4gb2YgY3VycmVudCBpdCBzaGFsbCBzdXBwbHk6Cj4+IOKAoiBEZWZhdWx0IGlz
IHRoZSBhcy1jb25maWd1cmVkIGZvciBoaWdoLXBvd2VyIG9wZXJhdGlvbiBjdXJyZW50IHZhbHVl
IGFzCj4+IGRlZmluZWQgYnkgdGhlIFVTQiBTcGVjaWZpY2F0aW9uICg1MDAgbUEgZm9yIFVTQiAy
LjAgcG9ydHM7IDkwMCBtQSBvcgo+PiAxLDUwMCBtQSBmb3IgVVNCIDMuMiBwb3J0cyBpbiBzaW5n
bGUtbGFuZSBvciBkdWFsLWxhbmUgb3BlcmF0aW9uLAo+PiByZXNwZWN0aXZlbHkpCj4+IOKAoiAx
LjUgQQo+PiDigKIgMy4wIEEKPj4KPj4+IENhbiB3ZSBhbGlnbiB0aGUgbmFtZXMgaW4gc29tZSB3
YXk/IHBvd2VyLW9wbW9kZSBhbmQgZnJzLXNvdXJjZS1vcG1vZGUKPj4+IG9yID8/Cj4gCj4gaG93
IGFib3V0IHR5cGVjLXBvd2VyLW9wbW9kZSBhbmQgZnJzLW5ldy1zb3VyY2Utb3Btb2RlCj4gCgpJ
IGFncmVlIHdpdGggdHlwZWMtcG93ZXItb3Btb2RlLiBBbmQgd2l0aCBzdHJpbmcgdmFsdWVzLiBU
aGlzIHdheSwgCnR5cGVjX2ZpbmRfcHdyX29wbW9kZSBpcyBzdGlsbCB1c2FibGUgdG8gdHJhbnNs
YXRlIGludG8gVFlQRUMgZGVmaW5lcy4KCj4+Pgo+Pgo+PiBJIGxldCBVU0IgUEQgc3BlY2lhbGlz
dHMgYW5zd2VyLgo+Pgo+PiAqZnJzKiBwcm9wZXJ0eSBmaXRzIHdpdGggVVNCIFBEIHNwZWNpZmlj
YXRpb24sIHNvIHdpdGggVVNCIFBEIHByb3RvY29sLgo+PiAqcG93ZXItb3Btb2RlIGZpdHMgd2l0
aCBVU0IgVHlwZS1DIHNwZWNpZmljYXRpb24sIHNvIHdpdGggVVNCLUMgaGFyZHdhcmUKPj4gc3Vw
cG9ydC4KPj4KPj4+IEFyZSB0aGVzZSAyIHByb3BlcnRpZXMgbXV0dWFsbHkgZXhjbHVzaXZlPwo+
IAo+IEkgdGhpbmsgeWVzLgo+IAo+IHRoYW5rcwo+IExpIEp1bgo+Pj4gSWYgc28sIHRoYXQgc2hv
dWxkIGJlCj4+PiBjYXB0dXJlZC4KPj4KPj4gRlJTIGlzIHNwZWNpZmljIHRvIHByb2R1Y3RzIHdp
dGggUG93ZXIgRGVsaXZlcnkgU3VwcG9ydC4KPj4KPj4gcG93ZXItb3Btb2RlIGlzIGRlZGljYXRl
ZCB0byBwcm9kdWN0cyB3aXRoIFVTQi1DIGNvbm5lY3RvciBzdXBwb3J0Lgo+Pgo+PiBSZWdhcmRz
LAo+PiBBbWVsaWUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
