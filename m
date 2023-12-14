Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C230B8135ED
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 17:14:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72CE4C6B47D;
	Thu, 14 Dec 2023 16:14:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6EEFC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 16:14:53 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BEFUWU9028453; Thu, 14 Dec 2023 17:14:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=c+4JDYOAWPGwGzrS2qgUpBZK/hN1dkyExfSzdEqAmz0=; b=2O
 qAvHNbAAH3lYaaHkFesV/i9BdKLXGmUDfVPeFvrZ57ZcXZAxPLiYDDRhYMOwCnSP
 TYB18SD9hSJYnXEZ7TN/UOvDXcQi4mJcVpUDhI8B6yTtnm2auU9B0vc7k8squwrA
 pU5vI1HuJCT8vFQDhemgWlrnaMRyxyOrRPVXZVOlWplrfc5pniXryW13F5EEMLwR
 AOnWpRQGg3nWxdWUdrV6TxbRpp9y0z557U5IR0v1C1kmprSM9QRH82pmKPdnH+Ut
 178ipAqw8HcAVOHoP1dhI4UrrzkCsQyfdbjRDNBlxF4VrqDHFO5HzF9ijl8AR1qa
 JkeivICbTI28LxJboWRw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehmpdch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Dec 2023 17:14:32 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BC27100053;
 Thu, 14 Dec 2023 17:14:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53E872721CE;
 Thu, 14 Dec 2023 17:14:31 +0100 (CET)
Received: from [10.201.21.122] (10.201.21.122) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Dec
 2023 17:14:30 +0100
Message-ID: <31a82fc0-814e-456d-83e2-a4daf111a648@foss.st.com>
Date: Thu, 14 Dec 2023 17:14:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
References: <20231206083142.1476340-2-u.kleine-koenig@pengutronix.de>
 <20231206084853.q4dfbp5twpe235se@pengutronix.de>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20231206084853.q4dfbp5twpe235se@pengutronix.de>
X-Originating-IP: [10.201.21.122]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_11,2023-12-14_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, kernel@dh-electronics.com,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp15x: Consolidate
 usbh_[eo]hci phy properties
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

SGkgVXdlCgpPbiAxMi82LzIzIDA5OjQ4LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxs
bywKPiAKPiBPbiBXZWQsIERlYyAwNiwgMjAyMyBhdCAwOTozMTo0M0FNICswMTAwLCBVd2UgS2xl
aW5lLUvDtm5pZyB3cm90ZToKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMybXAxNXh4LWRreC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGt4
LmR0c2kKPj4gaW5kZXggNTExMTEzZjJlMzk5Li43MDRjMGQwY2ZlNWYgMTAwNjQ0Cj4+IC0tLSBh
L2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRreC5kdHNpCj4+ICsrKyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNXh4LWRreC5kdHNpCj4+IEBAIC02ODAsOCArNjgwLDYg
QEAgJnVzYXJ0MyB7Cj4+ICAgfTsKPj4gICAKPj4gICAmdXNiaF9laGNpIHsKPj4gLQlwaHlzID0g
PCZ1c2JwaHljX3BvcnQwPjsKPj4gLQlzdGF0dXMgPSAib2theSI7Cj4gCj4gdGhlIHN0YXR1cyBw
cm9wZXJ0eSBtdXN0IGJlIGtlcHQuIEkgd2lsbCB3YWl0IGEgYml0IGZvciBmdXJ0aGVyIHJldmll
dwo+IGFuZCB0aGVuIHJlc2VuZCAodW5sZXNzIHRoaXMgcGF0Y2ggaXMgcGlja2VkIHVwIHdpdGgg
dGhpcyBpc3N1ZSBmaXhlZAo+IHVwKS4KCkFwcGxpZWQgd2l0aCB0aGUgZml4LiBGaXJzdCBJIGhh
ZCBhIHNtYWxsIGRvdWJ0IGFib3V0IHRoZSBwYXRjaCBhcyB3ZSAKY2FuIGFsc28gY2hvb3NlIHVz
YnBoeWNfcG9ydDEgZm9yIFVTQiBob3N0IGJ1dCBhcyB1c2JwaHljX3BvcnQwIHJlbWFpbnMgCmFs
d2F5cyBjb25uZWN0ZWQgdG8gdGhlIFVTQiBob3N0IHRoZW4geW91ciBwYXRjaCBtYWtlcyBjb21w
bGV0ZWx5IHNlbnMuCgpSZWdhcmRzCkFsZXgKCgo+IEJlc3QgcmVnYXJkcwo+IFV3ZQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
