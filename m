Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF95051A494
	for <lists+linux-stm32@lfdr.de>; Wed,  4 May 2022 17:54:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8959AC628AB;
	Wed,  4 May 2022 15:54:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32EE0C628A8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 May 2022 15:54:17 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 244Ed56B018222;
 Wed, 4 May 2022 17:54:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gDQ7kfKMayqT8+pKB/dp+vaUxlVpEafeO+qiPe95/JQ=;
 b=4FS98Ko4lxTUPN4sBxNEQL9LF+w33ecIKRbcMPeU0e6SZZL0JNkV/qPSvya95vhiazi3
 SzTEKjmdp2dLRT/wchaR4lLzL6dDffWe9ys36ceV/nB67rSWCvzl9Aqemp9Gt32kdcmq
 bxcQfzlCBcxttC7WGob45SmFMsy7IjI8uT+qivO3I7FaluGP9Fa9su7hbaFmoJBrDNez
 Y9lurpiSM3+BBPQYRsLGWrEH90oT+tkyoYCpNmbD13oWr0iIlGwNrgVwlkSBhT1zYWTP
 paFlg0GrbvpPyIJ+NFqey/XiRvRBefQko5Eren6QfD1VyHQUj0me9PBrGsYK7UV0uSLp Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frthjwegr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 May 2022 17:54:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AA7910002A;
 Wed,  4 May 2022 17:54:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC62322A6E5;
 Wed,  4 May 2022 17:54:05 +0200 (CEST)
Received: from [10.201.21.169] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 4 May
 2022 17:54:04 +0200
Message-ID: <57896136-5e08-b9fe-2e3e-0eff4388e064@foss.st.com>
Date: Wed, 4 May 2022 17:54:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-serial@vger.kernel.org>
References: <20220430162845.244655-1-marex@denx.de>
 <20220430162845.244655-2-marex@denx.de>
 <702dcede-ff97-b074-20bf-7c695f988d40@foss.st.com>
 <18f886d9-924b-e32b-e298-90e998b30662@denx.de>
From: Erwan LE RAY <erwan.leray@foss.st.com>
In-Reply-To: <18f886d9-924b-e32b-e298-90e998b30662@denx.de>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-04_04,2022-05-04_02,2022-02-23_01
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] serial: stm32: Use TC interrupt to
 deassert GPIO RTS in RS485 mode
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

SGkgTWFyZWssCgpPbiA1LzIvMjIgMTM6MTMsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMi8y
MiAxMDo0NCwgRXJ3YW4gTEUgUkFZIHdyb3RlOgo+PiBIaSBNYXJlaywKPiAKPiBIaSwKPiAKPj4g
T24gNC8zMC8yMiAxODoyOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+PiBJbiBjYXNlIHRoZSBSUzQ4
NSBtb2RlIGlzIGVtdWxhdGVkIHVzaW5nIEdQSU8gUlRTLCB1c2UgdGhlIFRDIGludGVycnVwdAo+
Pj4gdG8gZGVhc3NlcnQgdGhlIEdQSU8gUlRTLCBvdGhlcndpc2UgdGhlIEdQSU8gUlRTIHN0YXlz
IGFzc2VydGVkIGFmdGVyIGEKPj4+IHRyYW5zbWlzc2lvbiBlbmRlZCBhbmQgdGhlIFJTNDg1IGNh
bm5vdCB3b3JrLgo+Pj4KPj4gQ291bGQgeW91IHBsZWFzZSBhZGQgYSBjb3ZlciBsZXR0ZXIgdG8g
ZXhwbGFpbiB0aGUgcmF0aW9uYWwgb2YgdGhlIAo+PiBmaXJzdCBwYXRjaCA/IEkgdW5kZXJzdG9v
ZCB0aGUgZ29hbCBvZiB0aGUgZmlyc3QgYnkgcmVhZGluZyB0aGUgY29tbWl0IAo+PiBtZXNzYWdl
IG9mIHRoaXMgc2Vjb25kIHBhdGNoLgo+IAo+IFRoZSByYXRpb25hbGUgaXMgdHJpdmlhbCAtLSBt
YWtlIHN1cmUgd2UgZG9uJ3QgaGF2ZSBmaXZlIGNvcGllcyBvZiB0aGUgCj4gc2FtZSBibG9jayBv
ZiBjb2RlIGluIHRoZSBkcml2ZXIuCj4gQWdyZWUgYnV0IGZhY3Rvcml6YXRpb24gaXMgbmVlZGVk
IG9ubHkgYmVjYXVzZSBvZiB5b3VyIHNlY29uZCBwYXRjaCwgCnJlYXNvbiB3aHkgSSBzdWdnZXN0
ZWQgYSBjb3ZlciBsZXR0ZXIgZm9yIHRoZSBzZXJpZXMuCgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIAo+Pj4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3Rt
MzItdXNhcnQuYwo+Pj4gaW5kZXggMjI0ZjM1OWM2MDUxZS4uNzY0NDE1YjhlOGYwMyAxMDA2NDQK
Pj4+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+PiArKysgYi9kcml2
ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwo+Pj4gQEAgLTQxNyw2ICs0MTcsMTQgQEAgc3Rh
dGljIHZvaWQgCj4+PiBzdG0zMl91c2FydF90eF9pbnRlcnJ1cHRfZW5hYmxlKHN0cnVjdCB1YXJ0
X3BvcnQgKnBvcnQpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RtMzJfdXNhcnRfc2V0X2JpdHMo
cG9ydCwgb2ZzLT5jcjEsIFVTQVJUX0NSMV9UWEVJRSk7Cj4+PiDCoCB9Cj4+PiArc3RhdGljIHZv
aWQgc3RtMzJfdXNhcnRfdGNfaW50ZXJydXB0X2VuYWJsZShzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0
KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IHN0bTMyX3BvcnQgKnN0bTMyX3BvcnQgPSB0b19z
dG0zMl9wb3J0KHBvcnQpOwo+Pj4gK8KgwqDCoCBjb25zdCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zm
c2V0cyAqb2ZzID0gJnN0bTMyX3BvcnQtPmluZm8tPm9mczsKPj4+ICsKPj4+ICvCoMKgwqAgc3Rt
MzJfdXNhcnRfc2V0X2JpdHMocG9ydCwgb2ZzLT5jcjEsIFVTQVJUX0NSMV9UQ0lFKTsKPj4+ICt9
Cj4+PiArCj4+IEkgZG9uJ3Qgc2VlIHRoZSBhZGRlZCB2YWx1ZSBvZiB0aGlzIGhlbHBlciAob25s
eSAxIGluc3RydWN0aW9uIHVzZWQgMSAKPj4gdGltZSksIGFuZCBvdGhlciBJbnRlcnJ1cHQgRW5h
YmxlZCBiaXRzIGFyZSBhbHJlYWR5IHNldC91bnNldCBpbiAKPj4gb3RoZXJzIGZ1bmN0aW9ucyBv
ZiB0aGlzIGRyaXZlci4KPj4gVG8ga2VlcCBhbiBob21vZ2VuZW91cyBjb2RlIGluIHRoZSBkcml2
ZXIsIGNvdWxkIHlvdSBwbGVhc2UgcmVtb3ZlIAo+PiB0aGlzIGhlbHBlciBhbmQgc2V0IFRDSUUg
ZGlyZWN0bHkgd2hlbiB5b3UgbmVlZCBpdCA/Cj4gCj4gU2hvdWxkIEkgYWxzbyByZW1vdmUgc3Rt
MzJfdXNhcnRfdHhfaW50ZXJydXB0X2VuYWJsZSgpIC8gCj4gc3RtMzJfdXNhcnRfdHhfaW50ZXJy
dXB0X2Rpc2FibGUoKSAsIHdoaWNoIGRvZXMgdGhlIHNhbWUgdGhpbmcgZm9yIG90aGVyIAo+IGJp
dHMgaW4gdGhlIGludGVycnVwdCByZWdpc3RlciA/Cj4gCkluIHN0bTMyX3VzYXJ0X3R4X2ludGVy
cnVwdF9lbmFibGUoKSAvIApzdG0zMl91c2FydF90eF9pbnRlcnJ1cHRfZGlzYWJsZSgpIGNhc2Us
IDIgYml0cyBhcmUgY29uZmlndXJlZCAKZGlmZmVyZW50bHkgdW5kZXIgYSBjb25kaXRpb24sIGFu
ZCBzdG0zMl91c2FydF90eF9pbnRlcnJ1cHRfZGlzYWJsZSgpIGlzIApjYWxsZWQgNCB0aW1lcyBp
biB0aGUgZHJpdmVyLiBUaGUgZmFjdG9yaXphdGlvbiBpcyB0cmlnZ2VyZWQgYnkgdGhlIAptdWx0
aXBsZSBjYWxscyB0byB0aGlzIGNvZGUuCkluIHlvdXIgcHJvcG9zYWwsIHRoZSBoZWxwZXIgaXMg
ZXhlY3V0aW5nIGEgc2luZ2xlIGluc3RydWN0aW9uLCBhbmQgaXMgCmNhbGxlZCBvbmx5IG9uY2Us
IHJlYXNvbiB3aHkgSSBzdWdnZXN0ZWQgdG8gZW5hYmxlIC8gZGlzYWJsZSB0aGUgVENJRSAKZGly
ZWN0bHkgaW4geW91ciBuZXcgZnVuY3Rpb25zIHN0bTMyX3VzYXJ0X3RjX2ludGVycnVwdF9lbmFi
bGUoKSAvIApzdG0zMl91c2FydF90Y19pbnRlcnJ1cHRfZGlzYWJsZSgpLgoKPiBUaGF0IHNvdW5k
cyB0byBtZSBsaWtlIG1ha2luZyB0aGUgY29kZSBoYXJkZXIgdG8gcmVhZCwgbm90IGVhc2llci4K
PiAKPiBbLi4uXQoKUmVnYXJkcywgRXJ3YW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
