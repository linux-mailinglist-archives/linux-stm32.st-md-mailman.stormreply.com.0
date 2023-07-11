Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B574F04B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 15:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64203C6B44C;
	Tue, 11 Jul 2023 13:37:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 905DBC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:37:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36BC98m4015312; Tue, 11 Jul 2023 15:37:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=RjPhbi1cT49sUS0SQLqiRDs+n9LacP3Eh9vVSfof8mY=;
 b=NuabFqUi3Do7nr3nqeSNc3InSpQChaW7caK3QrsZcViN9f2ahGdSe2o4/bYAnXj/c0OQ
 A6yRWEon2a10QrDoVLJTQAMdllZD/prVNMrbqG5ulvvI4zp/DI5lsAWlSy+0PwX1Nv/u
 /W+3iazEm3HiXvxa8ENFFq2zUbeJmecoSn6bviKeVa+XW6ONIQI5uWJd7T5ZuMb3MJNG
 CxnHjcKbIGQh9YcwmSinZbHq9oJcF6BeiXUd5/eyoJoc+RcTg9zcGG3K76qdxXw6AI2p
 x0SOgXd1wYBKSKe94y1MuWzqqyJZyNdzfLe1NkRKXiKB38a0gv8sEGH89L3hcm7x4eot Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rs6u68j50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jul 2023 15:37:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EAFC100053;
 Tue, 11 Jul 2023 15:37:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19F6021863B;
 Tue, 11 Jul 2023 15:37:35 +0200 (CEST)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 11 Jul
 2023 15:37:34 +0200
Message-ID: <9e15a84e-33f7-3654-6ad2-66328c120ee6@foss.st.com>
Date: Tue, 11 Jul 2023 15:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230518011246.438097-1-marex@denx.de>
 <20230518011246.438097-4-marex@denx.de>
 <42b1d80b-9cbc-16e2-73a4-ee8b67f5cb2b@denx.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <42b1d80b-9cbc-16e2-73a4-ee8b67f5cb2b@denx.de>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_08,2023-07-11_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: Add missing detach
 mailbox for DHCOR SoM
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

SGkgTWFyZWsKCk9uIDcvMTEvMjMgMDQ6MDUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMTgv
MjMgMDM6MTIsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBBZGQgbWlzc2luZyAiZGV0YWNoIiBtYWls
Ym94IHRvIHRoaXMgYm9hcmQgdG8gcGVybWl0IHRoZSBDUFUgdG8gaW5mb3JtCj4+IHRoZSByZW1v
dGUgcHJvY2Vzc29yIG9uIGEgZGV0YWNoLiBUaGlzIHNpZ25hbCBhbGxvd3MgdGhlIHJlbW90ZSBw
cm9jZXNzb3IKPj4gZmlybXdhcmUgdG8gc3RvcCBJUEMgY29tbXVuaWNhdGlvbiBhbmQgdG8gcmVp
bml0aWFsaXplIHRoZSByZXNvdXJjZXMgZm9yCj4+IGEgcmUtYXR0YWNoLgo+Pgo+PiBXaXRob3V0
IHRoaXMgbWFpbGJveCwgZGV0YWNoIGlzIG5vdCBwb3NzaWJsZSBhbmQga2VybmVsIGxvZyBjb250
YWlucyB0aGUKPj4gZm9sbG93aW5nIHdhcm5pbmcgdG8sIHNvIG1ha2Ugc3VyZSBhbGwgdGhlIFNU
TTMyTVAxNXh4IHBsYXRmb3JtIERUcyBhcmUKPj4gaW4gc3luYyByZWdhcmRpbmcgdGhlIG1haWxi
b3hlcyB0byBmaXggdGhlIGRldGFjaCBpc3N1ZSBhbmQgdGhlIHdhcm5pbmc6Cj4+ICIKPj4gc3Rt
MzItcnByb2MgMTAwMDAwMDAubTQ6IG1ib3hfcmVxdWVzdF9jaGFubmVsX2J5bmFtZSgpIGNvdWxk
IG5vdCAKPj4gbG9jYXRlIGNoYW5uZWwgbmFtZWQgImRldGFjaCIKPj4gIgo+Pgo+PiBGaXhlczog
NjI1N2RmYzFjNDEyICgiQVJNOiBkdHM6IHN0bTMyOiBBZGQgY29wcm9jZXNzb3IgZGV0YWNoIG1i
b3ggb24gCj4+IHN0bTMybXAxNXgtZGt4IGJvYXJkcyIpCj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IFZhc3V0IDxtYXJleEBkZW54LmRlPgo+PiAtLS0KPj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0
QGtlcm5lbC5vcmc+Cj4+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpK2R0QGxpbmFyby5vcmc+Cj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0z
MkBnbWFpbC5jb20+Cj4+IENjOiBSaWNoYXJkIENvY2hyYW4gPHJpY2hhcmRjb2NocmFuQGdtYWls
LmNvbT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZwo+PiBDYzoga2VybmVsQGRoLWVsZWN0cm9uaWNzLmNvbQo+
PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0tLQo+PiDCoCBhcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1zb20uZHRzaSB8IDQgKystLQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kgCj4+IGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kKPj4gaW5kZXggODY0OTYw
Mzg3ZTYzNC4uZjAzNTFmNTk5YTUwOCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kKPj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJtcDE1eHgtZGhjb3Itc29tLmR0c2kKPj4gQEAgLTIyNyw4ICsyMjcsOCBAQCAmaXdkZzIgewo+
PiDCoCAmbTRfcnByb2Mgewo+PiDCoMKgwqDCoMKgIG1lbW9yeS1yZWdpb24gPSA8JnJldHJhbT4s
IDwmbWN1cmFtPiwgPCZtY3VyYW0yPiwgPCZ2ZGV2MHZyaW5nMD4sCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDwmdmRldjB2cmluZzE+LCA8JnZkZXYwYnVmZmVyPjsKPj4gLcKgwqDCoCBt
Ym94ZXMgPSA8JmlwY2MgMD4sIDwmaXBjYyAxPiwgPCZpcGNjIDI+Owo+PiAtwqDCoMKgIG1ib3gt
bmFtZXMgPSAidnEwIiwgInZxMSIsICJzaHV0ZG93biI7Cj4+ICvCoMKgwqAgbWJveGVzID0gPCZp
cGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAyPiwgPCZpcGNjIDM+Owo+PiArwqDCoMKgIG1ib3gt
bmFtZXMgPSAidnEwIiwgInZxMSIsICJzaHV0ZG93biIsICJkZXRhY2giOwo+PiDCoMKgwqDCoMKg
IGludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+PiDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8
NjggMT47Cj4+IMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+IAo+IElzIGFueXRoaW5nIGJs
b2NraW5nIDEvNS4uNC81IChpLmUuIHRoZSBkdXBsaWNhdGlvbiBpbiBlYWNoIGJvYXJkIERUKSAK
PiBwYXRjaGVzIGZyb20gYmVpbmcgYXBwbGllZCA/CgpOb3RoaW5nLiBJIHdhcyBqdXN0IHdhaXRp
bmcgdG8gZGlzY3VzcyB3aXRoIHlvdSBhYm91dCBwYXRjaCA1IGF0IFByYWd1ZSAKdGhlbiBtZXJn
ZSB3aW5kb3dzLgoKU28gcGF0Y2ggMSB0byA0IGFwcGxpZWQgb24gc3RtMzItbmV4dC4KCkNoZWVy
cwpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
