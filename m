Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90369622CBB
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 14:48:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38632C6504E;
	Wed,  9 Nov 2022 13:48:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53027C6411D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 13:48:54 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A99RCxn017326; Wed, 9 Nov 2022 14:48:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cDrNqqmthMwVZI1g/vQ96k/RiQCKxZZG2VRCp6nzpqw=;
 b=6BZ1fJ2La0R0u7d3rx4HFZakt9dvd6oBdIiXrc4kRm1Zhz+wLJPszP+d4LeUwiBJp5PX
 bpdNyI+HWSiI0mRp9LPQJyEzQ4d5MAVLSBLe45p5DEcHQA6grMfhg1iNjRQJ6VNALYOk
 kl9g6cAPftadVDl6VTcme78aELqsHqAkNKuwyVRM0yS1P7QEWCu2BTGauEZtQBkqxYl7
 78NPTvk9g6jdKAfXr+vA+/AT3nCSwW35uqud/MU7rkd/TnjoBr2ZdKquizY1wkFbYUg1
 vR6JyzOhGPF8W0C3BF00oxaSkU189kmWBAyVTP6rHLwIUh33ytRDKzDsEC206YYmxQXp QQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0aq87j8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 14:48:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E884810002A;
 Wed,  9 Nov 2022 14:48:20 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0A9D21D382;
 Wed,  9 Nov 2022 14:48:20 +0100 (CET)
Received: from [10.252.23.187] (10.252.23.187) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Wed, 9 Nov
 2022 14:48:19 +0100
Message-ID: <28c5e508-6893-8ca3-88cc-487a98871722@foss.st.com>
Date: Wed, 9 Nov 2022 14:48:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Marek Vasut <marex@denx.de>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Erwan LE RAY <erwan.leray@foss.st.com>,
 Valentin Caron <valentin.caron@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
 <cc7633c5-de5f-0abf-4ac8-64a74633dfcc@pengutronix.de>
 <f5aec360-c33c-0145-6596-541003e305b2@foss.st.com>
 <98823363-710c-6286-8e63-ba8e5dcadeba@foss.st.com>
 <20221108115916.hlmbvyrnmkxymeed@pengutronix.de>
 <230c26ea-f7c5-2688-16fd-e4a91f421833@denx.de>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <230c26ea-f7c5-2688-16fd-e4a91f421833@denx.de>
X-Originating-IP: [10.252.23.187]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, Amelie DELAUNAY <amelie.delaunay@st.com>,
 Pengutronix
 Kernel Team <kernel@pengutronix.de>, linux-kernel@vger.kernel.org,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 00/16] STM32 configure UART nodes for DMA
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

T24gMTEvOC8yMiAxNjoyOCwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gMTEvOC8yMiAxMjo1OSwg
VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IE9uIEZyaSwgRmViIDA0LCAyMDIyIGF0IDA0OjQx
OjU1UE0gKzAxMDAsIEVyd2FuIExFIFJBWSB3cm90ZToKPj4+IE9uIDIvNC8yMiAyOjIyIFBNLCBB
bGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+Pj4+IEhpIEFobWFkCj4+Pj4KPj4+PiBPbiAyLzMvMjIg
MTg6MjUsIEFobWFkIEZhdG91bSB3cm90ZToKPj4+Pj4gSGVsbG8gRXJ3YW4sCj4+Pj4+Cj4+Pj4+
IE9uIDAzLjAyLjIyIDE4OjEwLCBFcndhbiBMZSBSYXkgd3JvdGU6Cj4+Pj4+PiBBZGQgRE1BIGNv
bmZpZ3VyYXRpb24gdG8gVUFSVCBub2RlcyBpbiBzdG0zMm1wMTV4IChTT0MgbGV2ZWwpIGFuZAo+
Pj4+Pj4gcmVtb3ZlIGl0IGF0IGJvYXJkIGxldmVsIHRvIGtlZXAgY3VycmVudCBQSU8gYmVoYXZp
b3Igd2hlbiBuZWVkZWQuCj4+Pj4+PiBGb3Igc3RtMzItZWQxIGFuZCBzdG0zMi1ka3ggYm9hcmRz
LCBVQVJUNCAoY29uc29sZSkgYW5kIFVBUlQ3Cj4+Pj4+PiAobm8gSFcgZmxvdyBjb250cm9sIHBp
biBhdmFpbGFibGUpIGFyZSBrZXB0IGluIFBJTyBtb2RlLCB3aGlsZSBVU0FSVDMKPj4+Pj4+IGlz
IG5vdyBjb25maWd1cmVkIGluIERNQSBtb2RlLgo+Pj4+Pj4gVUFSVDQgKGNvbnNvbGUgVUFSVCkg
aGFzIHRvIGJlIGtlcHQgaW4gaXJxIG1vZGUsIGFzIERNQSBzdXBwb3J0IGZvcgo+Pj4+Pj4gY29u
c29sZSBoYXMgYmVlbiByZW1vdmVkIGZyb20gdGhlIGRyaXZlciBieSBjb21taXQgZTM1OWI0NDEx
YzI4Cj4+Pj4+PiAoInNlcmlhbDogc3RtMzI6IGZpeCB0aHJlYWRlZCBpbnRlcnJ1cHQgaGFuZGxp
bmciKS4KPj4+Pj4KPj4+Pj4gRG8gSSB1bmRlcnN0YW5kIGNvcnJlY3RseSB0aGF0IHlvdXIgZmly
c3QgcGF0Y2ggYnJlYWtzIGNvbnNvbGVzIG9mCj4+Pj4+IG1vc3QvYWxsIGJvYXJkcywgYmVjYXVz
ZSB0aGV5IHdpbGwgYnJpZWZseSB1c2UgRE1BLCB3aGljaCBpcyByZWZ1c2VkCj4+Pj4+IGJ5IHRo
ZSBzdG0zMi11c2FydCBkcml2ZXIgYW5kIHRoZW4geW91IGFkZCBhIHBhdGNoIGZvciBlYWNoIGJv
YXJkCj4+Pj4+IHRvIGZpeCB0aGF0IGJyZWFrYWdlPwo+Pj4+Cj4+Pj4gV2UgaGF2ZSB0d28gc29s
dXRpb25zIGFuZCBib3RoIGhhdmUgcHJvL2RyYXdiYWNrcy4gVGhlIGZpcnN0IG9uZSAoRXJ3YW4K
Pj4+PiBvbmVzLCBjYW4gYnJlYWsgdGhlIGJvb3QgaWYgdGhlIHBhdGNoIGlzIHRha2VuICJhbG9u
ZSIuIFlvdXIgCj4+Pj4gcHJvcG9zaXRpb24KPj4+PiBhdm9pZHMgdGhpcyBicmVha2FnZSBidXQg
ZGVsZXRlcyBhIG5vbiBkZWZpbmUgcHJvcGVydHkgKHdoaWNoIGlzIGEgYml0Cj4+Pj4gd2VpcmQp
LiBIb3dldmVyIEkgcHJlZmVyIHRvIGtlZXAgYSBmdW5jdGlvbmFsIGJlaGF2aW9yLCBhbmQga2Vl
cCBBaG1hZAo+Pj4+IHByb3Bvc2l0aW9uLiBBaG1hZCwganVzdCBvbmUgcXVlc3Rpb24sIGR0LWJp
bmRpbmdzIGNoZWNrIGRvZXNuJ3QKPj4+PiBjb21wbGFpbiBhYm91dCBpdCA/Cj4+Pj4KPj4+PiBD
aGVlcnMKPj4+PiBBbGV4Cj4+Pj4KPj4+Pj4KPj4+Pj4gU3VjaCBpbnRlcm1pdHRlbnQgYnJlYWth
Z2UgbWFrZXMgYmlzZWN0aW9uIGEgaGFzc2xlLiAvZGVsZXRlLXByb3BlcnR5Lwo+Pj4+PiBpcyBh
IG5vLW9wIHdoZW4gdGhlIHByb3BlcnR5IGRvZXNuJ3QgZXhpc3QsIHNvIHlvdSBjb3VsZCBtb3Zl
IHRoZSAKPj4+Pj4gZmlyc3QKPj4+Pj4gcGF0Y2ggdG8gdGhlIHZlcnkgZW5kIHRvIGF2b2lkIGlu
dGVybWl0dGVudCBicmVha2FnZS4KPj4+Pj4KPj4+Pj4gSSBhbHNvIHRoaW5rIHRoYXQgdGhlIGRy
aXZlcidzIGJlaGF2aW9yIGlzIGEgYml0IGhhcnNoLiBJIHRoaW5rIGl0IAo+Pj4+PiB3b3VsZAo+
Pj4+PiBiZSBiZXR0ZXIgZm9yIHRoZSBVQVJUIGRyaXZlciB0byBwcmludCBhIHdhcm5pbmcgYW5k
IGZhbGwgYmFjayB0bwo+Pj4+PiBQSU8gZm9yIGNvbnNvbGUgaW5zdGVhZCBvZiBvdXRyaWdodCBy
ZWZ1c2luZyBhbmQgcmVuZGVyaW5nIHRoZSBzeXN0ZW0KPj4+Pj4gc2lsZW50LiBUaGF0J3Mgbm90
IG11dHVhbGx5IGV4Y2x1c2l2ZSB3aXRoIHlvdXIgcGF0Y2ggc2VyaWVzIGhlcmUsCj4+Pj4+IG9m
IGNvdXJzZS4KPj4+Pj4KPj4+Pj4gQ2hlZXJzLAo+Pj4+PiBBaG1hZAo+Pj4+Pgo+Pj4KPj4+IFRo
ZSBkcml2ZXIgaW1wbGVtZW50YXRpb24gd2lsbCBjb25zaWRlciB0aGUgcmVxdWVzdCB0byBwcm9i
ZSB0aGUgVUFSVAo+Pj4gY29uc29sZSBpbiBETUEgbW9kZSBhcyBhbiBlcnJvciAoLUVOT0RFViks
IGFuZCB3aWxsIGZhbGxiYWNrIHRoaXMgCj4+PiBVQVJUIHByb2JlCj4+PiBpbiBpcnEgbW9kZS4K
Pj4KPj4+IFdoYXRldmVyIHRoZSBwYXRjaCBvcmRlcmluZywgdGhlIGJvb3Qgd2lsbCBuZXZlciBi
ZSBicm9rZW4uIFRoZSBib2FyZCBkdAo+Pj4gcGF0Y2hlcyBhaW0gdG8gZ2V0IGEgInByb3BlciIg
aW1wbGVtZW50YXRpb24sIGJ1dCBmcm9tIGZ1bmN0aW9uYWwKPj4+IHBlcnNwZWN0aXZlIHRoZSBk
cml2ZXIgd2lsbCBtYW5hZ2UgYSByZXF1ZXN0IHRvIHByb2JlIGFuIFVBUlQgY29uc29sZSAKPj4+
IGluIERNQQo+Pj4gbW9kZSBhcyBhbiBlcnJvciBhbmQgZmFsbCBpdCBiYWNrIGluIGlycSBtb2Rl
Lgo+Pgo+PiBJIGRpZG4ndCBkZWJ1ZyB0aGlzIGZ1cnRoZXIgeWV0LCBidXQgbXkgbWFjaGluZSAo
d2l0aCBhbiBvdXQtb2YtdHJlZQo+PiBkdHMpIGZhaWxzIHRvIGJvb3QgNi4xLXJjNCB3aXRob3V0
IHJlbW92aW5nIHRoZSBkbWEgcHJvcGVydGllcyBmcm9tIHRoZQo+PiBjb25zb2xlIFVBUlQuIFRo
aXMgaXMgYSBidWcgaXNuJ3QgaXQ/IFRoZSBzYW1lIGR0cyBjcmVhdGVkIGEgd29ya2luZwo+PiBz
ZXR1cCB3aXRoIHN0bTMybXAxNTcuZHRzaSBmcm9tIDUuMTUgKyBrZXJuZWwgNS4xNS4KCkhpIFV3
ZSwKCkNvdWxkIHlvdSBjb25maXJtIGVhcmx5Y29uIGlzIGVuYWJsZWQgb24geW91ciBzZXR1cD8K
CldpdGhvdXQgZWFybHljb24sIGJvb3QgaXMgb2ssIGV2ZW4gd2l0aCBkbWEgcHJvcGVydGllcywg
YXQgbGVhc3Qgb24gCnN0bTMybXAxNTdjLWRrMi4KCj4+Cj4+IEkgY2FuIGRlYnVnIHRoaXMgZnVy
dGhlciwgYnV0IG1heWJlIHlvdSBrbm93IG9mZi1oYW5kIHdoYXQgdGhlIHByb2JsZW0KPj4gaXM/
Cj4gCj4gK0NDIEFtZWxpZSwgYXMgdGhpcyBtaWdodCBiZSByZWxhdGVkIHRvIHRoZSBETUEgc2Vy
aWVzIHRoYXQgbGFuZGVkIAo+IHJlY2VudGx5Ogo+IAo+ICQgZ2l0IGxvZyAtLW9uZWxpbmUgdjUu
MTguLnY2LjAgLS0gZHJpdmVycy9kbWEvc3RtMzIqCgpIaSBNYXJlaywKCldlIGhhdmVuJ3QgeWV0
IGludmVzdGlnYXRlZCB0aGUgaXNzdWUsIGFuZCBpZiBsYXRlc3QgRE1BIHVwZGF0ZXMgY291bGQg
CmV4cGxhaW4gd2h5IGVhcmx5Y29uIGJyZWFrcyB0aGUgYm9vdC4KCgorVE8gVmFsZW50aW4sIGFz
IGhlJ3Mgbm93IGluIGNoYXJnZSBvZiBVQVJUIGRyaXZlci4KVmFsZW50aW4gYW5kIEkgd2lsbCBp
bnZlc3RpZ2F0ZSB0aGlzIGlzc3VlLgoKUmVnYXJkcywKQW1lbGllCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
