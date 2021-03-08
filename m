Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD523313D2
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Mar 2021 17:51:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A4B9C57B53;
	Mon,  8 Mar 2021 16:51:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DCC53C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Mar 2021 16:39:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128Gahwp002139; Mon, 8 Mar 2021 17:39:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=lUanr3ZpmCB3U0jr2bLwFO2QyK5JXzFcC9COIqgwtzk=;
 b=PQTeahtvfKGtkZYoInIwcu0/H8vvvWdql7IbYVEMIjuooMKXRbUjPei5TefzGKekA1mx
 Nj4hkxGCrpmSm0XP7PSfD57OCCIAfa1m8XOdlvGNKdLN+aeAUei+yQvgI9VcmcaXZRnV
 J/iEK+h2kxujZrkG9w4daly8zq2Yhb29E7V23Wz7xArMaagfEHba5r8FYQThaz8Ep3oM
 zQbn07KwySZ5xT0H+zUF1TJJSzQCD0XlpRsH7krY8v2okrzYb/mEkgia3NryFUFsB1zS
 za0ls5LR+uLGOKLdQSav/QYnCKpPXnesuyvEpc973CBam/CzZ9My0qWkkL230RoPu8YG yA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3741gpc94g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:39:39 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F0BA410002A;
 Mon,  8 Mar 2021 17:39:37 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C531B225A72;
 Mon,  8 Mar 2021 17:39:37 +0100 (CET)
Received: from [10.211.9.90] (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 8 Mar
 2021 17:39:37 +0100
To: Alexandre TORGUE-SCND-02 <alexandre.torgue@foss.st.com>, "Fuzzey, Martin"
 <martin.fuzzey@flowbird.group>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
References: <CANh8Qzy9B5qCkwZLiWaJahQX4oMg07dn0276vqeCzEcqgXTd+g@mail.gmail.com>
 <AS8PR10MB471293F419829DD8A3684F59EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
 <AS8PR10MB4712324DCF8BFD6937F83820EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
From: Fabien Dessenne <fabien.dessenne@foss.st.com>
Message-ID: <baee3e0f-b635-71ab-12dd-222b9831833b@foss.st.com>
Date: Mon, 8 Mar 2021 17:39:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AS8PR10MB4712324DCF8BFD6937F83820EE9F9@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_11:2021-03-08,
 2021-03-08 signatures=0
X-Mailman-Approved-At: Mon, 08 Mar 2021 16:51:37 +0000
Cc: Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>
Subject: Re: [Linux-stm32] [BUG] stm32mp1 gpiod_to_irq() can cause
	"interrupt stealing"
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

SGksCgoKSSBoYXZlIGEgZml4IGZvciB0aGF0IGlzc3VlLCBidXQgSSBuZWVkIHRvIHNwZW5kIG1v
cmUgdGltZSB0ZXN0aW5nIHNvbWUgCmFkZGl0aW9uYWwgY29ybmVyIGNhc2VzLgoKQXMgc3VnZ2Vz
dGVkIGJ5IEFsZXhhbmRyZSwgSSBoYXZlIG1vdmVkIHRoZSBFWFRJIE1VWCB2YWxpZGl0eSBmcm9t
IHRoZSAKLmFjdGl2YXRlKCkgdG8gdGhlIC5hbGxvYygpIG9wcy4KCmdwaW9kX3RvX2lycSgpIGNh
bGxzIChpbmRpcmVjdGx5KSBpcnFfY3JlYXRlX2Z3c3BlY19tYXBwaW5nKCkgd2hpY2ggdGhlbiAK
Y2FsbHMgLmFjdGl2YXRlKCkuIFNvIHRoZSBpbnZhbGlkIElSUSBjYW4gYmUgZGV0ZWN0ZWQgZWFy
bGllciBhdm9pZGluZyAKdG8gYnJlYWsgdGhlIGlycSBtYXBwaW5nLgoKVGhhbmsgeW91IE1hcnRp
biBmb3IgaGF2aW5nIHJhaXNlZCB0aGF0IGlzc3VlLgpJJ2xsIHBvc3QgdGhlIGZpeCBhcyBzb29u
IGFzIEkgaGF2ZSBwYXNzZSBtb3JlIHRlc3RzLgoKQlIKCkZhYmllbgoKCgpPbiAyNC8wMi8yMDIx
IDU6MzcgcG0sIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkgTWFydGluCj4gCj4gRHVlIHRv
IG15IG1haWxlciBteSBhbnN3ZXIgd2FzIG5vdCBjbGVhci4KPiAKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogQWxleGFuZHJlIFRPUkdVRSA8YWxleGFuZHJlLnRvcmd1ZUBz
dC5jb20+Cj4+IFNlbnQ6IG1lcmNyZWRpIDI0IGbDqXZyaWVyIDIwMjEgMTY6NTkKPj4gVG86IEZ1
enpleSwgTWFydGluIDxtYXJ0aW4uZnV6emV5QGZsb3diaXJkLmdyb3VwPjsgbGludXgtc3RtMzJA
c3QtbWQtCj4+IG1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gQ2M6IEZhYmllbiBERVNTRU5ORSAt
IGZvc3MgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPj4gU3ViamVjdDogUmU6IFtCVUdd
IHN0bTMybXAxIGdwaW9kX3RvX2lycSgpIGNhbiBjYXVzZSAiaW50ZXJydXB0IHN0ZWFsaW5nIgo+
Pgo+PiBIaSBNYXJ0aW4KPj4KPj4KPj4gRnJvbTogRnV6emV5LCBNYXJ0aW4gPG1hcnRpbi5mdXp6
ZXlAZmxvd2JpcmQuZ3JvdXA+Cj4+IFNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjQsIDIwMjEg
MzoxNSBQTQo+PiBUbzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSA8
bGludXgtc3RtMzJAc3QtbWQtCj4+IG1haWxtYW4uc3Rvcm1yZXBseS5jb20+Cj4+IENjOiBBbGV4
YW5kcmUgVE9SR1VFIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPj4gU3ViamVjdDogW0JVR10g
c3RtMzJtcDEgZ3Bpb2RfdG9faXJxKCkgY2FuIGNhdXNlICJpbnRlcnJ1cHQgc3RlYWxpbmciCj4+
Cj4+IEhpLAo+Pgo+PiBJIGhhdmUgcnVuIGludG8gYSByYXRoZXIgbmFzdHkgcHJvYmxlbSBvbiBT
VE0zMk1QMSBhbmQgSSdtIG5vdCBxdWl0ZSBzdXJlCj4+IG9mIHRoZSByaWdodCB3YXkgdG8gZml4
IGl0IChvdGhlcndpc2UgSSB3b3VsZCBoYXZlIHNlbnQgYSBwYXRjaCkuCj4+Cj4+IEl0IGlzIHBv
c3NpYmxlIGZvciBvbmUgZHJpdmVyIHRvIGJyZWFrIGFub3RoZXIgZHJpdmVyJ3MgR1BJTyBpbnRl
cnJ1cHRzLgo+PiBJbiBmYWN0IGl0IGlzIGV2ZW4gcG9zc2libGUgZm9yIHVzZXJzcGFjZSB0byBi
cmVhayBhIGRyaXZlcidzIGludGVycnVwdHMuCj4+Cj4+IE9uIFNUTTMyTVAxIHRoZSBleHRlcm5h
bCBHUElPIGludGVycnVwdHMgZ28gdGhyb3VnaCB0aGUgRVhUSSBtb2R1bGUKPj4gd2hpY2ggaGFz
IDE2IGludGVycnVwdCBsaW5lcyBjb25uZWN0ZWQgdG8gdGhlIEFSTSBHSUMuCj4+IFRoZSBFWFRJ
IG1hcHMgdGhlIEdQSU8gaW50ZXJydXB0cyBieSBsaW5lIG51bWJlciAoc28gR1BJT0FfMCwgR1BJ
T0JfMAo+PiAuLi4pIGFsbCBzaGFyZSBvbmUgR0lDIGludGVycnVwdCBsaW5lIGFuZCBvbmx5IG9u
ZSBjYW4gYmUgdXNlZCBhdCBhbnkgdGltZQo+PiAoc2VsZWN0ZWQgYnkgYSBtdWx0aXBsZXhlciBy
ZWdpc3RlciBpbiB0aGUgRVhUSSkKPj4KPj4gVGhlIGV4aXN0aW5nIHN0bTMybXAxIHBpbmN0cmwg
ZHJpdmVyIGFscmVhZHkgaGFuZGxlcyB0aGlzLCBib3RoIHRoZSBzZXR0aW5nIG9mCj4+IHRoZSBF
WFRJIG11bHRpcGxleGVyIGFuZCBtdXR1YWwgZXhjbHVzaW9uLgo+Pgo+PiBIb3dldmVyIGNvbnNp
ZGVyIGEgZHJpdmVyIHdoaWNoIGRvZXMgc29tZXRoaW5nIGxpa2UKPj4KPj4gICAgICBpbnQgaXJx
ID0gZ3Bpb2RfdG9faXJxKGdwaW9kKTsKPj4gICAgICBpbnQgcmV0ID0gZGV2bV9yZXF1ZXN0X2ly
cShkZXYsIGlycSwgLi4uKQo+Pgo+PiBTdXBwb3NlIHRoZXJlIGFyZSAyIHN1Y2ggZHJpdmVycyB1
c2luZyBhIGdwaW9kIGNvbmZpZ3VyZWQgZnJvbSBEVCB0aGF0Cj4+IGhhcHBlbiB0byBib3RoIGhh
dmUgdGhlIHNhbWUgbGluZSBudW1iZXIgKGVnIEdQSU9BMCBhbmQgR1BJT0IwKQo+Pgo+PiBJbiB0
aGlzIGNhc2UgZXZlcnl0aGluZyB3b3JrcyBmaW5lIGluaXRpYWxseSBmb3IgdGhlIGZpcnN0IGRy
aXZlciB0byBwcm9iZS4KPj4gV2hlbiB0aGUgc2Vjb25kIGRyaXZlciBwcm9iZXMgZ3Bpb2RfdG9f
aXJxKCkgb2J0YWlucyBhIGxpbnV4IHZpcnEgbnVtYmVyCj4+IGJ1dCBkZXZtX3JlcXVlc3RfaXJx
KCkgcmV0dXJucyAtRUJVU1kuCj4+IFNvIGZhciBzbyBnb29kLCB0aGUgRFQgY29uZmlndXJhdGlv
biB3YXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgaGFyZHdhcmUKPj4gY29uc3RyYWludHMgc28g
aXQgaXMgZXhwZWN0ZWQgdG8gZmFpbC4KPj4KPj4gSG93ZXZlciwgYWZ0ZXIgdGhlIHNlY29uZCBk
cml2ZXIgY2FsbHMgZ3Bpb2RfdG9faXJxKCksIHRoZSBpbnRlcnJ1cHQgYWxyZWFkeQo+PiBzdWNj
ZXNzZnVsbHkgb2J0YWluZWQgYnkgdGhlIGZpcnN0IGRyaXZlciBubyBsb25nZXIgcmVjZWl2ZXMg
YW55IGludGVycnVwdHMuCj4+Cj4+IFRoZSByZWFzb24gaXMgdGhhdCBncGlvZF90b19pcnEoKSBj
YWxscyB0aGUgLmFsbG9jIGZ1bmN0aW9uIG9mIHRoZSBFWFRJIGludGVycnVwdAo+PiBjb250cm9s
bGVyIHdoaWNoLCBpbiB0dXJuIGNhbGxzIC5hbGxvYyBvZiB0aGUgcGFyZW50IEdJQyBpbnRlcnJ1
cHQgY29udHJvbGxlci4KPj4KPj4gVGhhdCBub3Qgb25seSBhbGxvY2F0ZXMgYSBsaW51eCB2aXJx
IG51bWJlciBidXQgYWxzbyBjaGFuZ2VzIHRoZSBtYXBwaW5nIG9mCj4+IHRoZSBHSUMgaW50ZXJy
dXB0IGxpbmUgdG8gdGhlIG5ldyBWSVJRLgo+Pgo+PiBTbyB3aGVuIGFuIGludGVycnVwdCBvY2N1
cnMgb24gdGhlIEdQSU8gdXNlZCBieSB0aGUgZmlyc3QgZHJpdmVyIGl0IHdpbGwgbm93Cj4+IGJl
IG1hcHBlZCB0byB0aGUgVklSUSBhbGxvY2F0ZWQgYnkgdGhlIHNlY29uZCBkcml2ZXIgYW5kIGln
bm9yZWQuLi4KPiAKPiAKPiAKPiBFdmVuIGlmIHRoaXMgc2Vjb25kIGludGVycnVwdCBpcyBmcmVl
ZCA/IFdlIGhhdmUgdG8gY2hlY2sgaWYgd2UgbmVlZCB0byBhZGQgYQo+IGxpbmsgYmV0d2VlbiAu
YWxsb2MgYW5kIC5hY3RpdmF0ZSBjYWxsYmFja3Mgb3IgbW92ZSB0aGUgcHJvdGVjdGlvbi4KPiAK
PiAKPiAKPj4gV2hlbiB1c2luZyB0aGUgbGVnYWN5IHN5c2ZzIGdwaW8gaW50ZXJmYWNlIGl0IGlz
IGV2ZW4gd29yc2UgYmVjYXVzZSBpdCBpcwo+PiBwb3NzaWJsZSB0byBicmVhayB0aGUgaW50ZXJy
dXB0cyBvZiBhIGtlcm5lbCBkcml2ZXIgd2l0aG91dCBldmVuIGV4cGxpY2l0bHkKPj4gcmVxdWVz
dGluZyBhbiBpbnRlcnJ1cHQgZnJvbSB1c2Vyc3BhY2UuCj4+Cj4+IGRyaXZlcnMvZ3Bpby9ncGlv
bGliLXN5c2ZzLmMgY29udGFpbnMgdGhpcyBmdW5jdGlvbgo+Pgo+PiBzdGF0aWMgdW1vZGVfdCBn
cGlvX2lzX3Zpc2libGUoc3RydWN0IGtvYmplY3QgKmtvYmosIHN0cnVjdCBhdHRyaWJ1dGUgKmF0
dHIsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IG4pCj4+IHsKPj4gLi4u
Cj4+ICAgICAgICAgIGlmIChhdHRyID09ICZkZXZfYXR0cl9kaXJlY3Rpb24uYXR0cikgewo+PiAg
ICAgICAgICAgICAgICAgIGlmICghc2hvd19kaXJlY3Rpb24pCj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICBtb2RlID0gMDsKPj4gICAgICAgICAgfSBlbHNlIGlmIChhdHRyID09ICZkZXZfYXR0
cl9lZGdlLmF0dHIpIHsKPj4gICAgICAgICAgICAgICAgICBpZiAoZ3Bpb2RfdG9faXJxKGRlc2Mp
IDwgMCkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIG1vZGUgPSAwOwo+PiAgICAgICAgICAg
ICAgICAgIGlmICghc2hvd19kaXJlY3Rpb24gJiYgdGVzdF9iaXQoRkxBR19JU19PVVQsICZkZXNj
LT5mbGFncykpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBtb2RlID0gMDsKPj4gICAgICAg
ICAgfQo+Pgo+PiAgICAgICAgICByZXR1cm4gbW9kZTsKPj4gfQo+Pgo+PiBUaGUgcHVycG9zZSBv
ZiB0aGlzIGlzIHRvIGhpZGUgdGhlICJlZGdlIiBhdHRyaWJ1dGUgaWYgdGhlIEdQSU8gZG9lcyBu
b3QKPj4gc3VwcG9ydCBpbnRlcnJ1cHRzIChldmVuIGlmIG5vIGludGVycnVwdCBoYXMgeWV0IGJl
ZW4gcmVxdWVzdGVkIGZvciB0aGF0Cj4+IEdQSU8pIEl0IGRvZXMgdGhpcyB1c2luZyB0aGUgY2Fs
bCB0byBncGlvZF90b19pcnEoKSBhbmQgaGlkaW5nIHRoZSBhdHRyaWJ1dGUgaWYgaXQKPj4gZmFp
bHMuCj4+Cj4+IFNvLCBtZXJlbHkgZXhwb3J0aW5nIHRvIHVzZXJzcGFjZSB2aWEgc3lzZnMgYSBH
UElPIChldmVuIG5vdCBhcyBhbgo+PiBpbnRlcnJ1cHQpIGhhdmluZyB0aGUgc2FtZSBsaW5lIG51
bWJlciBhcyBhbm90aGVyIEdQSU8gdXNlZCBieSBhIGtlcm5lbAo+PiBkcml2ZXIgd2lsbCBicmVh
ayBpbnRlcnJ1cHRzIGZvciB0aGF0IGRyaXZlci4uLgo+Pgo+PiBSZWdhcmRzLAo+Pgo+PiBNYXJ0
aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
