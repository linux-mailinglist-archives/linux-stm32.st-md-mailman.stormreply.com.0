Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E557687E0A
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Feb 2023 13:57:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE80EC65E42;
	Thu,  2 Feb 2023 12:57:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99534C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Feb 2023 12:57:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 312BcPv8004028; Thu, 2 Feb 2023 13:57:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : to : cc : from : subject : content-type :
 content-transfer-encoding; s=selector1;
 bh=FRrOlPoLGshk2ugiIl1XFFrFNI9pnP4+tvTaVUWHofs=;
 b=NkcURONDd/QrvfOy+ncNsuwdp3PBCPhV8JLeaOZKsPAis6CBe+8qJ9bD56o+dERxQHd0
 73RRq/q/0g+ciTjTsTU5b2YU0WXjdZV7nCLGhVRVGg1rCUWnuVRF0dTeujwLSuIEwIl9
 4vhHNr6dOUuYvE5FfAZdiQJ4WlH+4fTXmGSZFC9JqoV6PGgnMxWYfK+JQj5rOND/YbG7
 +UgUYZm+nbBQCk10tZpEplbE0X1eIf3dsVfjZTBfKij1+PH5wAEqWOeyJjAU2n0DcIj6
 n/y8VY7BHDajzyCoKPFI+IM1J0da87Ea1mxIc6qT/BT1YqggaNMudoHio2L/LMXgdxFh jQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3nfn39h053-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Feb 2023 13:57:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DA72D10002A;
 Thu,  2 Feb 2023 13:57:23 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2352217B89;
 Thu,  2 Feb 2023 13:57:23 +0100 (CET)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 2 Feb
 2023 13:57:23 +0100
Message-ID: <3e815504-e85e-cbd3-6e6d-4e5a7aa7469a@foss.st.com>
Date: Thu, 2 Feb 2023 13:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin
 Hilman <khilman@baylibre.com>, arm-soc <arm@kernel.org>, SoC Team
 <soc@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_04,2023-02-02_01,2022-06-22_01
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 DT changes for v6.3 #1
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

SGkgQVJNIFNvQyBtYWludGFpbmVycywKClBsZWFzZSBjb25zaWRlciB0aGlzIChsYXRlKSBmaXJz
dCByb3VuZCBvZiBTVE0zMiBEVCBmb3IgdjYuMyBjeWNsZS4gTWFpbiAKY2hhbmdlcyBjb25jZXJu
IHBlcmlwaGVyYWwgc3VwcG9ydCBvbiBTVE0zMk1QMTMgYW5kIHlhbWwgZml4ZXMuCgpUaGFua3MK
QWxleAoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAxNzUyODFmODA2OTU1Njlj
N2Y5Y2YwNjJlNWQwZGRjNGFkZGMxMDlmOgoKICAgQVJNOiBkdHM6IHN0bTMyOiBGaXggcXNwaSBw
aW5jdHJsIHBoYW5kbGUgZm9yIHN0bTMybXAxNTFhLXBydHQxbCAKKDIwMjMtMDEtMTcgMTQ6NDg6
NDQgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0bTMy
LmdpdCAKdGFncy9zdG0zMi1kdC1mb3ItdjYuMy0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8gN2UxNzkwZDI2YTkyZTA1Y2M2YTJkMGJhYjk4ZDhlYTQwYWUyOGQ5ZDoKCiAgIEFSTTog
ZHRzOiBzdG0zMjogZml4IGNvbXBhdGlibGUgZm9yIEJTRUMgb24gU1RNMzJNUDEzICgyMDIzLTAy
LTAyIAoxMzoyOTo1OSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU1RNMzIgRFQgZm9yIHY2LjMsIHJvdW5kIDEK
CkhpZ2hsaWdodHM6Ci0tLS0tLS0tLS0KCi0gTVBVOgogICAtIFNUIGJvYXJkczoKICAgICAtIEFk
ZCBmb2xsb3dpbmcgcGVyaXBoZXJhbHMgc3VwcG9ydCBvbiBzdG0zMm1wMTM6CiAgICAgICBpMnMs
IFNBSSwgU1BESUZSWCwgREZTRE0sIFRpbWVycwogICAgIC0gQWRkIHRpbWVycyBzdXBwb3J0IG9u
IHN0bTMybXAxMzVmLWRrIGJvYXJkLgogICAgIC0gQWRkIGRlY2ljYXRlZCBCU0VDIGNvbXBhdGli
bGUgb24gU1RNMzJNUDEzLgogICAgIC0gUmVuYW1lIHNvdW5kIGNhcmQgb24gU1RNMzJNUDE1IERL
eC4KICAgICAtIEZpeCB5YW1sIHZhbGlkYXRpb24gaXNzdWVzLgoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpBbWVsaWUgRGVs
YXVuYXkgKDEpOgogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBGaXggVXNlciBidXR0b24gb24gc3Rt
MzJtcDEzNWYtZGsKCkJlcm5oYXJkIFJvc2Vua3LDpG56ZXIgKDEpOgogICAgICAgQVJNOiBkdHM6
IHN0bTMyOiBSZW1vdmUgdGhlIHBpbnMtYXJlLW51bWJlcmVkIHByb3BlcnR5CgpMYXVyZW50IFBp
bmNoYXJ0ICgxKToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogVXNlIG5ldyBtZWRpYSBidXMgdHlw
ZSBtYWNyb3MKCk9saXZpZXIgTW95c2FuICg5KToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogcmVt
b3ZlIHNhaSBrZXJuZWwgY2xvY2sgb24gc3RtMzJtcDE1eHgtZGt4CiAgICAgICBBUk06IGR0czog
c3RtMzI6IHJlbmFtZSBzb3VuZCBjYXJkIG9uIHN0bTMybXAxNXh4LWRreAogICAgICAgQVJNOiBk
dHM6IHN0bTMyOiBhZGQgaTJzIG5vZGVzIG9uIHN0bTMybXAxMzEKICAgICAgIEFSTTogZHRzOiBz
dG0zMjogYWRkIHNhaSBub2RlcyBvbiBzdG0zMm1wMTMxCiAgICAgICBBUk06IGR0czogc3RtMzI6
IGFkZCBzcGRpZnJ4IG5vZGUgb24gc3RtMzJtcDEzMQogICAgICAgQVJNOiBkdHM6IHN0bTMyOiBh
ZGQgZGZzZG0gbm9kZSBvbiBzdG0zMm1wMTMxCiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCB0
aW1lcnMgc3VwcG9ydCBvbiBzdG0zMm1wMTMxCiAgICAgICBBUk06IGR0czogc3RtMzI6IGFkZCB0
aW1lciBwaW5zIG11eGluZyBmb3Igc3RtMzJtcDEzNWYtZGsKICAgICAgIEFSTTogZHRzOiBzdG0z
MjogYWRkIHRpbWVycyBzdXBwb3J0IG9uIHN0bTMybXAxMzVmLWRrCgpQYXRyaWNrIERlbGF1bmF5
ICgyKToKICAgICAgIEFSTTogZHRzOiBzdG0zMjogVXBkYXRlIHBhcnQgbnVtYmVyIE5WTUVNIGRl
c2NyaXB0aW9uIG9uIHN0bTMybXAxMzEKICAgICAgIEFSTTogZHRzOiBzdG0zMjogZml4IGNvbXBh
dGlibGUgZm9yIEJTRUMgb24gU1RNMzJNUDEzCgogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyNDI5
aS1ldmFsLmR0cyAgICAgfCAgIDMgKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0
cmwuZHRzaSAgIHwgICAxIC0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRz
aSAgIHwgICAxIC0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmg3NDMuZHRzaSAgICAgICAgIHwg
ICAxIC0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTMtcGluY3RybC5kdHNpIHwgIDYwICsr
KwogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxMzEuZHRzaSAgICAgICAgfCA3MTAgCisrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTM1
Zi1kay5kdHMgICAgIHwgIDYwICsrLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRz
aSAgICAgICAgfCAgIDIgLQogIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWV2MS5kdHMg
ICAgfCAgIDMgKy0KICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1ka3guZHRzaSAgIHwg
ICA0ICstCiAgMTAgZmlsZXMgY2hhbmdlZCwgODMyIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
