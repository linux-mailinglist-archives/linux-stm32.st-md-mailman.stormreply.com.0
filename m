Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2B32A7D2A
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 12:37:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C13EC3FAD4;
	Thu,  5 Nov 2020 11:37:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 764B6C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 11:37:16 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5BS4XO013965; Thu, 5 Nov 2020 12:36:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=GD9jEceIxlMsIrgJmQF6VGJY1YfRz3aoD8368VuZnoM=;
 b=aEHtkTEVxB9ySM+wZiu9wxj8eiN+VELZNqQ7EXfUyJnIY5RLvWXsO5Z3PZRf//3squ5n
 5oB8oxkAAIyjcECxQRaJbfSjUZEhq7Vyp3OfYJeWH70npb2tUsO8qBxkK4ng6wDsbZL2
 U6gvLDFleoNUQGEOoLk3XTzIo3j3Kcm+F0EeHKDHDerk6N2kopB1E5kdKVoO91FoKJSD
 Q5I9spqpggH0GmFKE//xyx/2Z0ApUeD1CbUsU7dYfFZLJw7F88bRixIuDrDoEn397IFw
 WkEQruy7/DBPaXpf03zn4sN+060M7XlVqM2loEtoIj3luiXn7noA4QMtOJibNLFgWLiV 6w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00enp2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 12:36:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A48E910002A;
 Thu,  5 Nov 2020 12:36:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88BA5244C1C;
 Thu,  5 Nov 2020 12:36:48 +0100 (CET)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 5 Nov
 2020 12:36:47 +0100
To: Rob Herring <robh@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Badhri Jagan Sridharan
 <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
 <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com>
 <20201104210803.GA4115079@bogus>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <2da804ff-3b3c-0ea9-14d5-a163b28ccc33@st.com>
Date: Thu, 5 Nov 2020 12:36:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201104210803.GA4115079@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG3NODE3.st.com (10.75.127.9) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_07:2020-11-05,
 2020-11-05 signatures=0
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
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

T24gMTEvNC8yMCAxMDowOCBQTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gRnJpLCBPY3QgMzAs
IDIwMjAgYXQgMDQ6Mjc6MTRQTSArMDEwMCwgQW1lbGllIERFTEFVTkFZIHdyb3RlOgo+Pgo+Pgo+
PiBPbiAxMC8zMC8yMCAzOjI5IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPj4+IE9uIFRodSwgT2N0
IDI5LCAyMDIwIGF0IDExOjQ5IEFNIEFtZWxpZSBERUxBVU5BWSA8YW1lbGllLmRlbGF1bmF5QHN0
LmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pgo+Pj4+Cj4+Pj4gT24gMTAvMjkvMjAgNDo0MCBQTSwgUm9i
IEhlcnJpbmcgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgT2N0IDI5LCAyMDIwIGF0IDEwOjU4OjAzQU0g
KzAxMDAsIEFtZWxpZSBEZWxhdW5heSB3cm90ZToKPj4+Pj4+IFBvd2VyIG9wZXJhdGlvbiBtb2Rl
IG1heSBkZXBlbmRzIG9uIGhhcmR3YXJlIGRlc2lnbiwgc28sIGFkZCB0aGUgb3B0aW9uYWwKPj4+
Pj4+IHByb3BlcnR5IHBvd2VyLW9wbW9kZSBmb3IgdXNiLWMgY29ubmVjdG9yIHRvIHNlbGVjdCB0
aGUgcG93ZXIgb3BlcmF0aW9uCj4+Pj4+PiBtb2RlIGNhcGFiaWxpdHkuCj4+Pj4+Pgo+Pj4+Pj4g
U2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+
Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgLi4uL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9y
LnlhbWwgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9y
LnlhbWwKPj4+Pj4+IGluZGV4IDcyOGY4MmRiMDczZC4uMjAwZDE5YzYwZmQ1IDEwMDY0NAo+Pj4+
Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2It
Y29ubmVjdG9yLnlhbWwKPj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4+Pj4+PiBAQCAtOTMsNiArOTMsMjQg
QEAgcHJvcGVydGllczoKPj4+Pj4+ICAgICAgICAgICAtIGRldmljZQo+Pj4+Pj4gICAgICAgICAg
IC0gZHVhbAo+Pj4+Pj4KPj4+Pj4+ICsgIHBvd2VyLW9wbW9kZToKPj4+Pj4KPj4+Pj4gSSd2ZSBh
Y2tlZCB0aGlzIHZlcnNpb246Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyMDEwMjAwOTM2MjcuMjU2ODg1LTItYmFkaHJpQGdvb2dsZS5jb20KPj4+Pj4KPj4+Pgo+Pj4+
IGZycyBpcyB1c2VkIGZvciBGYXN0IFJvbGUgU3dhcCBkZWZpbmVkIGluIFVTQiBQRCBzcGVjLgo+
Pj4+IEkgdW5kZXJzdGFuZCBpdCBhbGxvd3MgdG8gZ2V0IHRoZSBzYW1lIGluZm9ybWF0aW9uIGJ1
dCBJJ20gd29uZGVyaW5nIHdoeQo+Pj4+IHRoZSBwcm9wZXJ0eSBuYW1lIGlzIGxpbWl0ZWQgdG8g
LWZycy0gaW4gdGhpcyBjYXNlLiBXaGF0IGFib3V0IGEKPj4+PiBub24tcG93ZXIgZGVsaXZlcnkg
VVNCLUMgY29ubmVjdG9yID8KPj4+Cj4+PiBJJ3ZlIGdvdCBubyBpZGVhLiBUaGUgZm9sa3MgdGhh
dCBrbm93IFVTQi1DIGFuZCBQRCBkZXRhaWxzIG5lZWQgdG8gZ2V0Cj4+PiB0b2dldGhlciBhbmQg
d29yayBhbGwgdGhpcyBvdXQuIFRvIG1lLCBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIHRoaW5nLi4u
Cj4+Pgo+Pgo+PiBJdCBsb29rcyBidXQuLi4KPj4KPj4gVGhlIHB1cnBvc2Ugb2YgcG93ZXItb3Bt
b2RlIHByb3BlcnR5IGlzIHRvIGNvbmZpZ3VyZSB0aGUgVVNCLUMgY29udHJvbGxlcnMsCj4+IGVz
cGVjaWFsbHkgdGhlIG5vbi1QRCBVU0ItQyBjb250cm9sbGVycyB0byBkZXRlcm1pbmUgdGhlIHBv
d2VyIG9wZXJhdGlvbgo+PiBtb2RlIHRoYXQgdGhlIFR5cGUgQyBjb25uZWN0b3Igd2lsbCBzdXBw
b3J0IGFuZCB3aWxsIGFkdmVydGlzZSB0aHJvdWdoIENDCj4+IHBpbnMgd2hlbiBpdCBoYXMgbm8g
cG93ZXIgZGVsaXZlcnkgc3VwcG9ydCwgd2hhdGV2ZXIgdGhlIHBvd2VyIHJvbGU6IFNpbmssCj4+
IFNvdXJjZSBvciBEdWFsCj4+IFRoZSBtYW5hZ2VtZW50IG9mIHRoZSBwcm9wZXJ0eSBpcyB0aGUg
c2FtZSB0aGF0IGRhdGEtcm9sZSBhbmQgcG93ZXItcm9sZQo+PiBwcm9wZXJ0aWVzLCBhbmQgZG9u
ZSBieSBVU0IgVHlwZS1DIENvbm5lY3RvciBDbGFzcy4KPj4KPj4gbmV3LXNvdXJjZS1mcnMtdHlw
ZWMtY3VycmVudCBzcGVjaWZpZXMgaW5pdGlhbCBjdXJyZW50IGNhcGFiaWxpdHkgb2YgdGhlIG5l
dwo+PiBzb3VyY2Ugd2hlbiB2U2FmZTVWIGlzIGFwcGxpZWQgZHVyaW5nIFBEMy4wIEZhc3QgUm9s
ZSBTd2FwLiBTbyBoZXJlLCB0aGlzCj4+IHByb3BlcnR5IGlzIG5vdCBhcHBsaWVkIGF0IHVzYi1j
IGNvbnRyb2xsZXIgY29uZmlndXJhdGlvbiBsZXZlbCwgYnV0IGR1cmluZwo+PiBQRCBGYXN0IFJv
bGUgU3dhcCwgc28gd2hlbiB0aGUgU2luayBiZWNvbWUgdGhlIFNvdXJjZS4KPj4gTW9yZW92ZXIs
IHRoZSByZWxhdGVkIGRyaXZlciBjb2RlIHNheXMgRlJTIGNhbiBvbmx5IGJlIHN1cHBvcnRlZCBi
eSBEUlAKPj4gcG9ydHMuIFNvIG5ldy1zb3VyY2UtZnJzLXR5cGVjLWN1cnJlbnQgcHJvcGVydHks
IGluIGFkZGl0aW9uIHRvIGJlaW5nCj4+IHNwZWNpZmljIHRvIFBELCBpcyBhbHNvIGRlZGljYXRl
ZCB0byBEUlAgdXNiLWMgY29udHJvbGxlci4KPj4gVGhlIHByb3BlcnR5IGlzIG1hbmFnZWQgYnkg
VHlwZS1DIFBvcnQgQ29udHJvbGxlciBNYW5hZ2VyIGZvciBQRC4KPiAKPiBCdXQgaXQncyB0aGUg
c2FtZSBzZXQgb2YgcG9zc2libGUgdmFsdWVzLCByaWdodD8gU28gd2UgY2FuIGFsaWduIHRoZQo+
IHZhbHVlcyBhdCBsZWFzdC4KPiAKClVTQiBQb3dlciBEZWxpdmVyeSBGUlMgdmFsdWVzIGFyZSBk
ZWZpbmVkIGluIAppbmNsdWRlL2R0LWJpbmRpbmdzL3VzYi9wZC5oIHRvIGZpdCB3aXRoIGRyaXZl
cnMvdXNiL3R5cGVjL3RjcG0vdGNwbS5jIApmcnNfdHlwZWNfY3VycmVudCBlbnVtLgoKVVNCLUMg
cG93ZXIgb3BlcmF0aW9uIG1vZGUgdmFsdWVzIGFyZSBkZWZpbmVkIGluIAppbmNsdWRlL2xpbnV4
L3VzYi90eXBlYy5oIHdpdGggdHlwZWNfcHdyX29wbW9kZSBlbnVtIGFuZCBtYXRjaGluZyB3aXRo
IApzdHJpbmcgdmFsdWVzIG9mIHR5cGVjX3B3cl9vcG1vZGVzIHRhYi4KClVTQiBQRCByZXF1aXJl
cyBVU0ItQy4KVVNCLUMgZG9lc24ndCByZXF1aXJlcyBVU0IgUEQuCgpkcml2ZXJzL3VzYi90eXBl
Yy90Y3BtL3RjcG0uYyBhbHJlYWR5IHVzZWQgdHlwZWNfcHdyX29wbW9kZSB2YWx1ZXMuCgpVU0Ig
UEQgc3BlY2lmaWNhdGlvbiBUYWJsZSA2LTE0IEZpeGVkIFN1cHBseSBQRE8gc2F5czoKRmFzdCBS
b2xlIFN3YXAgcmVxdWlyZWQgVVNCIFR5cGUtQyBDdXJyZW50IChzZWUgYWxzbyBbVVNCIFR5cGUt
QyAyLjBdKToKVmFsdWUgfCBEZXNjcmlwdGlvbgogIDAwYiAgfCBGYXN0IFN3YXAgbm90IHN1cHBv
cnRlZCAoZGVmYXVsdCkKICAwMWIgIHwgRGVmYXVsdCBVU0IgUG93ZXIKICAxMGIgIHwgMS41QSBA
IDVWCiAgMTFiICB8IDMuMEEgQCA1VgoKTm90ZSB0aGUgKnNlZSBhbHNvIFVTQiBUeXBlLUMgMi4w
Ki4KClVTQiBUeXBlLUMgc3BlY2lmaWNhdGlvbiA0LjYuMi4xIFVTQiBUeXBlLUMgQ3VycmVudCBz
YXlzOgpUaGUgVVNCIFR5cGUtQyBjb25uZWN0b3IgdXNlcyBDQyBwaW5zIGZvciBjb25maWd1cmF0
aW9uIGluY2x1ZGluZyBhbiAKYWJpbGl0eSBmb3IgYSBTb3VyY2UgdG8gYWR2ZXJ0aXNlIHRvIGl0
cyBwb3J0IHBhcnRuZXIgKFNpbmspIHRoZSBhbW91bnQgCm9mIGN1cnJlbnQgaXQgc2hhbGwgc3Vw
cGx5OgrigKIgRGVmYXVsdCBpcyB0aGUgYXMtY29uZmlndXJlZCBmb3IgaGlnaC1wb3dlciBvcGVy
YXRpb24gY3VycmVudCB2YWx1ZSBhcyAKZGVmaW5lZCBieSB0aGUgVVNCIFNwZWNpZmljYXRpb24g
KDUwMCBtQSBmb3IgVVNCIDIuMCBwb3J0czsgOTAwIG1BIG9yIAoxLDUwMCBtQSBmb3IgVVNCIDMu
MiBwb3J0cyBpbiBzaW5nbGUtbGFuZSBvciBkdWFsLWxhbmUgb3BlcmF0aW9uLCAKcmVzcGVjdGl2
ZWx5KQrigKIgMS41IEEK4oCiIDMuMCBBCgo+IENhbiB3ZSBhbGlnbiB0aGUgbmFtZXMgaW4gc29t
ZSB3YXk/IHBvd2VyLW9wbW9kZSBhbmQgZnJzLXNvdXJjZS1vcG1vZGUKPiBvciA/Pwo+IAoKSSBs
ZXQgVVNCIFBEIHNwZWNpYWxpc3RzIGFuc3dlci4KCipmcnMqIHByb3BlcnR5IGZpdHMgd2l0aCBV
U0IgUEQgc3BlY2lmaWNhdGlvbiwgc28gd2l0aCBVU0IgUEQgcHJvdG9jb2wuCipwb3dlci1vcG1v
ZGUgZml0cyB3aXRoIFVTQiBUeXBlLUMgc3BlY2lmaWNhdGlvbiwgc28gd2l0aCBVU0ItQyBoYXJk
d2FyZSAKc3VwcG9ydC4KCj4gQXJlIHRoZXNlIDIgcHJvcGVydGllcyBtdXR1YWxseSBleGNsdXNp
dmU/IElmIHNvLCB0aGF0IHNob3VsZCBiZQo+IGNhcHR1cmVkLgoKRlJTIGlzIHNwZWNpZmljIHRv
IHByb2R1Y3RzIHdpdGggUG93ZXIgRGVsaXZlcnkgU3VwcG9ydC4KCnBvd2VyLW9wbW9kZSBpcyBk
ZWRpY2F0ZWQgdG8gcHJvZHVjdHMgd2l0aCBVU0ItQyBjb25uZWN0b3Igc3VwcG9ydC4KClJlZ2Fy
ZHMsCkFtZWxpZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
