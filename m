Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B556CC5FE
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 17:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC6A9C6905A;
	Tue, 28 Mar 2023 15:21:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE3F0C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 15:21:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32SEBd7o005936; Tue, 28 Mar 2023 17:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3sl3gaodW7BicjGmVlR6sK/D2fcnxp6E1ErIi0k9bhc=;
 b=IgjZwH/52DBT+sjCMLfoF+gi2dHoas0bL/boWHnDG1mnLKJ1Nluxd0FmEpbDEiObgsAB
 q3ZhS60MZil9FfQGpL0g/Y9RsCEJAfhmXDtHtBvnNqTfAKWQ4S3PAdVOhHBEeaplTMUP
 WUHBL9eweB2bontmSdbnNTdnm5OJDTpJe0lS8U/Znx7HdhsPcFqSyGIiUMnUzhB/sAj+
 7/Z5OEuYYkotU+mLsWxa+lBviRYPCMo6V0xISmymDx2DlCuPb6SzgUEkGrqlTeCxP5nx
 tQXLgRIfHW2BQAtvlIhQDTFiT1+5BM/AxfuDdiJ0re0cLPjaMyjlAhHt6ERFtWKrJ+r3 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pk5xkjq9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Mar 2023 17:21:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C77A310002A;
 Tue, 28 Mar 2023 17:21:09 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1C252194CB;
 Tue, 28 Mar 2023 17:21:09 +0200 (CEST)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Tue, 28 Mar
 2023 17:21:09 +0200
Message-ID: <50e8d0ee-fe6f-7e31-98f0-ea4eceb597d6@foss.st.com>
Date: Tue, 28 Mar 2023 17:21:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
References: <20230327152948.274743-1-valentin.caron@foss.st.com>
 <20230327152948.274743-2-valentin.caron@foss.st.com>
 <5c67d003-c893-8540-a971-6954a57399e5@foss.st.com>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <5c67d003-c893-8540-a971-6954a57399e5@foss.st.com>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/7] ARM: dts: stm32: change USART1 clock
 to an SCMI clock on stm32mp15 boards
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

SGkgQWxleCwKCkkgdGhpbmsgdGhpcyBwYXRjaCBpcyB1c2VsZXNzLgpJIHdpbGwgc2VuZCB5b3Ug
YSBWMiB3aXRob3V0LgoKVGhhbmsgeW91LApWYWxlbnRpbgoKT24gMy8yOC8yMyAxNDowMiwgQWxl
eGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBWYWxlbnRpbgo+Cj4gT24gMy8yNy8yMyAxNzoyOSwg
VmFsZW50aW4gQ2Fyb24gd3JvdGU6Cj4+IE9uIFNUIHN0bTMybXAxNSBib2FyZHMsIGNoYW5nZSBj
bG9jayBvZiBVU0FSVDEgbm9kZSB0byBTQ01JIGNsb2NrCj4+ICJDS19TQ01JX1VTQVJUMSIKPgo+
IEknbGwgY2hhbmdlIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZSBhcyB5b3VyIHBhdGNoIGRvZXNu
J3QgdGFyZ2V0IAo+IFNUTTQzTVAxNSBib2FyZHMgYnV0IFNUTTMyTVAxNSBTQ01JIGJvYXJkcy4K
Pgo+IENoZWVycwo+IEFsZXgKPgo+Cj4KPj4gU2lnbmVkLW9mZi1ieTogVmFsZW50aW4gQ2Fyb24g
PHZhbGVudGluLmNhcm9uQGZvc3Muc3QuY29tPgo+PiAtLS0KPj4gwqAgYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2EtZGsxLXNjbWkuZHRzIHwgNCArKysrCj4+IMKgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdjLWRrMi1zY21pLmR0cyB8IDQgKysrKwo+PiDCoCBhcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1lZDEtc2NtaS5kdHMgfCA0ICsrKysKPj4gwqAgYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJtcDE1N2MtZXYxLXNjbWkuZHRzIHwgNCArKysrCj4+IMKgIDQgZmlsZXMgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2EtZGsxLXNjbWkuZHRzIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdhLWRrMS1zY21pLmR0cwo+PiBpbmRleCBlNTM5Y2M4MGJlZjguLjVjODE2NGMxMGU0NiAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2EtZGsxLXNjbWkuZHRz
Cj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS1zY21pLmR0cwo+PiBA
QCAtNzcsMyArNzcsNyBAQCAmcm5nMSB7Cj4+IMKgICZydGMgewo+PiDCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9SVENBUEI+LCA8JnNjbWlfY2xrIENLX1NDTUlfUlRDPjsK
Pj4gwqAgfTsKPj4gKwo+PiArJnVzYXJ0MSB7Cj4+ICvCoMKgwqAgY2xvY2tzID0gPCZzY21pX2Ns
ayBDS19TQ01JX1VTQVJUMT47Cj4+ICt9Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2MtZGsyLXNjbWkuZHRzIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWRrMi1zY21pLmR0cwo+PiBpbmRleCA5N2U0Zjk0YjBhMjQuLjJjOWEyMDdhOWQ0OSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLXNjbWkuZHRz
Cj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRrMi1zY21pLmR0cwo+PiBA
QCAtODMsMyArODMsNyBAQCAmcm5nMSB7Cj4+IMKgICZydGMgewo+PiDCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9SVENBUEI+LCA8JnNjbWlfY2xrIENLX1NDTUlfUlRDPjsK
Pj4gwqAgfTsKPj4gKwo+PiArJnVzYXJ0MSB7Cj4+ICvCoMKgwqAgY2xvY2tzID0gPCZzY21pX2Ns
ayBDS19TQ01JX1VTQVJUMT47Cj4+ICt9Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2MtZWQxLXNjbWkuZHRzIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWVkMS1zY21pLmR0cwo+PiBpbmRleCA5Y2YwYTQ0ZDJmNDcuLjIxYzgxNjlmMGU4MiAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZWQxLXNjbWkuZHRz
Cj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS1zY21pLmR0cwo+PiBA
QCAtODIsMyArODIsNyBAQCAmcm5nMSB7Cj4+IMKgICZydGMgewo+PiDCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9SVENBUEI+LCA8JnNjbWlfY2xrIENLX1NDTUlfUlRDPjsK
Pj4gwqAgfTsKPj4gKwo+PiArJnVzYXJ0MSB7Cj4+ICvCoMKgwqAgY2xvY2tzID0gPCZzY21pX2Ns
ayBDS19TQ01JX1VTQVJUMT47Cj4+ICt9Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1N2MtZXYxLXNjbWkuZHRzIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWV2MS1zY21pLmR0cwo+PiBpbmRleCAzYjlkZDZmNGNjYzkuLjAwODRhYmJlYjYwZSAx
MDA2NDQKPj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLXNjbWkuZHRz
Cj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS1zY21pLmR0cwo+PiBA
QCAtODgsMyArODgsNyBAQCAmcm5nMSB7Cj4+IMKgICZydGMgewo+PiDCoMKgwqDCoMKgIGNsb2Nr
cyA9IDwmc2NtaV9jbGsgQ0tfU0NNSV9SVENBUEI+LCA8JnNjbWlfY2xrIENLX1NDTUlfUlRDPjsK
Pj4gwqAgfTsKPj4gKwo+PiArJnVzYXJ0MSB7Cj4+ICvCoMKgwqAgY2xvY2tzID0gPCZzY21pX2Ns
ayBDS19TQ01JX1VTQVJUMT47Cj4+ICt9Owo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
