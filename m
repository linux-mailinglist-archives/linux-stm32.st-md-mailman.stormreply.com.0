Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D31915046
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 16:43:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52608C71282;
	Mon, 24 Jun 2024 14:43:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A27ADC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 14:43:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ODT690017080;
 Mon, 24 Jun 2024 16:43:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 FDQqDeGBhOzd+z+gYx2dRkj2fnt78H+rCdF+VFiaJcc=; b=qslt2FLeTkNuSTgG
 FWEK3BzU3lE/f9wYZiDR+qbKV48FdFR6ubicgIUDwYKjV9LxAsP51JAPdGKXHkcU
 W2hi8YgILi5iJTAhqrOuoU7hZ+Wps2HdRXJYQt3CwvPMXBCNE8VcF3mhGSGZolOL
 mGi49Rbw1gNwC5KvDUCndpp93daBoJWZnM0e0M1BsqI/HZjDvjS6MmanVivr3w7k
 tUwO1cL3iz9nc4zvixbC9hKng7AYlQEmxuEN2ArP089/3TwA1ZAq7ej0qoExVmV8
 pmdi8uCSPTra5gbpjAwXli3yOYrd3PF+2oWCFU0J8ps9hXk02+RqmQM/Tnz9K8hB
 dCdAFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ywnxx7jux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jun 2024 16:43:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1FF3C40047;
 Mon, 24 Jun 2024 16:42:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 280FB221E8B;
 Mon, 24 Jun 2024 16:42:07 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 24 Jun
 2024 16:42:06 +0200
Message-ID: <c8b7d693-5008-49c4-883a-66e2f9a3c7b2@foss.st.com>
Date: Mon, 24 Jun 2024 16:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
References: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20240624024113.54850-1-jiapeng.chong@linux.alibaba.com>
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_11,2024-06-24_01,2024-05-17_01
Cc: mcoquelin.stm32@gmail.com, daniel@ffwll.ch,
 Abaci Robot <abaci@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: Remove unused function
	plane_to_ltdc
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

SGkgSmlhcGVuZywKClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQWNrZWQtYnk6IFlhbm5pY2sgRmVy
dHJlIDx5YW5uaWNrLmZlcnRyZUBmb3NzLnN0LmNvbT4KCkJlc3QgcmVnYXJkcwoKCkxlIDI0LzA2
LzIwMjQgw6AgMDQ6NDEsIEppYXBlbmcgQ2hvbmcgYSDDqWNyaXTCoDoKPiBUaGUgZnVuY3Rpb24g
YXJlIGRlZmluZWQgaW4gdGhlIGx0ZGMuYyBmaWxlLCBidXQgbm90IGNhbGxlZAo+IGFueXdoZXJl
LCBzbyBkZWxldGUgdGhlIHVudXNlZCBmdW5jdGlvbi4KPgo+IGRyaXZlcnMvZ3B1L2RybS9zdG0v
bHRkYy5jOjQ5NDozNTogd2FybmluZzogdW51c2VkIGZ1bmN0aW9uICdlbmNvZGVyX3RvX2x0ZGMn
Lgo+Cj4gUmVwb3J0ZWQtYnk6IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4K
PiBDbG9zZXM6IGh0dHBzOi8vYnVnemlsbGEub3BlbmFub2xpcy5jbi9zaG93X2J1Zy5jZ2k/aWQ9
OTQwMwo+IFNpZ25lZC1vZmYtYnk6IEppYXBlbmcgQ2hvbmcgPGppYXBlbmcuY2hvbmdAbGludXgu
YWxpYmFiYS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8IDUgLS0t
LS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMKPiBp
bmRleCA1NTc2ZmRhZTQ5NjIuLjNmMjgwMTU1ZTI1YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gQEAg
LTQ5MSwxMSArNDkxLDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgbHRkY19kZXZpY2UgKnBsYW5l
X3RvX2x0ZGMoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gICAJcmV0dXJuIChzdHJ1Y3QgbHRk
Y19kZXZpY2UgKilwbGFuZS0+ZGV2LT5kZXZfcHJpdmF0ZTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMg
aW5saW5lIHN0cnVjdCBsdGRjX2RldmljZSAqZW5jb2Rlcl90b19sdGRjKHN0cnVjdCBkcm1fZW5j
b2RlciAqZW5jKQo+IC17Cj4gLQlyZXR1cm4gKHN0cnVjdCBsdGRjX2RldmljZSAqKWVuYy0+ZGV2
LT5kZXZfcHJpdmF0ZTsKPiAtfQo+IC0KPiAgIHN0YXRpYyBpbmxpbmUgZW51bSBsdGRjX3BpeF9m
bXQgdG9fbHRkY19waXhlbGZvcm1hdCh1MzIgZHJtX2ZtdCkKPiAgIHsKPiAgIAllbnVtIGx0ZGNf
cGl4X2ZtdCBwZjsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
