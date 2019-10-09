Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10799D0E72
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 14:13:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC675C36B0D;
	Wed,  9 Oct 2019 12:13:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75685C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 12:13:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x99CCEoL025666
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 9 Oct 2019 14:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=WfMYtU63/LF59VGYdrXV7Qa9KTfM6SXNOq9YHJIyZn8=;
 b=JBRszCb5JkW1YX8sJtLBeQ9CyfTM7l3faO6AQb95i/YKCEb2tKOnTSPXR4+TYK1PnaIN
 iV3v78huF725pOb1YlY8DnetDjGtT1X0V1ySDb56/vneF1uctjUZg8Ca5AJAQt3/aw0e
 McVIkUNFAnKUtyOHgalSltqyvXdWT1GlJjX7Y2fc5oh3v067shDOtF82nCCoSFC5bKA6
 ss945jdpt3LKQKVPGmWpsM2sDImY8eFTMR42mJOWD5Ije6jScvvFf/BSlkM0cAL8ElPT
 GGtqTrW/o53r4sG1YRDhjfgPU/+vntCPLwYXwDeMNFlv1km61s24XwmlIwYdC1MRCNW8 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pe43s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 09 Oct 2019 14:13:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E9C4100034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 14:13:35 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5543820CF76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 14:13:35 +0200 (CEST)
Received: from lmecxl0923.lme.st.com (10.75.127.48) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Oct
 2019 14:13:35 +0200
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20191009115415.15691-1-ben.dooks@codethink.co.uk>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <ab1bae2b-6182-6d4c-6c28-3fd957861153@st.com>
Date: Wed, 9 Oct 2019 14:13:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191009115415.15691-1-ben.dooks@codethink.co.uk>
Content-Language: fr
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-09_05:2019-10-08,2019-10-09 signatures=0
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: make
 sdmmc_idma_validate_data static
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

CgpMZSAxMC85LzE5IMOgIDE6NTQgUE0sIEJlbiBEb29rcyBhIMOpY3JpdMKgOgo+IE1ha2Ugc2Rt
bWNfaWRtYV92YWxpZGF0ZV9kYXRhIHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcgd2FybmluZwo+IGZy
b20gc3BhcnNlOgo+IAo+IGRyaXZlcnMvbW1jL2hvc3QvbW1jaV9zdG0zMl9zZG1tYy5jOjI4OjU6
IHdhcm5pbmc6IHN5bWJvbCAnc2RtbWNfaWRtYV92YWxpZGF0ZV9kYXRhJyB3YXMgbm90IGRlY2xh
cmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8
YmVuLmRvb2tzQGNvZGV0aGluay5jby51az4KClJldmlld2VkLWJ5OiBMdWRvdmljIEJhcnJlIDxs
dWRvdmljLmJhcnJlQHN0LmNvbT4KCj4gLS0tCj4gQ2M6IFVsZiBIYW5zc29uIDx1bGYuaGFuc3Nv
bkBsaW5hcm8ub3JnPgo+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+
IENjOiBsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnCj4gLS0tCj4gICBkcml2ZXJzL21tYy9ob3N0L21tY2lfc3RtMzJfc2RtbWMuYyB8IDQg
KystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMgYi9k
cml2ZXJzL21tYy9ob3N0L21tY2lfc3RtMzJfc2RtbWMuYwo+IGluZGV4IDhlODNhZTY5MjBhZS4u
Mjk2YmU4YTA2MGE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaV9zdG0zMl9z
ZG1tYy5jCj4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9tbWNpX3N0bTMyX3NkbW1jLmMKPiBAQCAt
MjUsOCArMjUsOCBAQCBzdHJ1Y3Qgc2RtbWNfcHJpdiB7Cj4gICAJdm9pZCAqc2dfY3B1Owo+ICAg
fTsKPiAgIAo+IC1pbnQgc2RtbWNfaWRtYV92YWxpZGF0ZV9kYXRhKHN0cnVjdCBtbWNpX2hvc3Qg
Kmhvc3QsCj4gLQkJCSAgICAgc3RydWN0IG1tY19kYXRhICpkYXRhKQo+ICtzdGF0aWMgaW50IHNk
bW1jX2lkbWFfdmFsaWRhdGVfZGF0YShzdHJ1Y3QgbW1jaV9ob3N0ICpob3N0LAo+ICsJCQkJICAg
IHN0cnVjdCBtbWNfZGF0YSAqZGF0YSkKPiAgIHsKPiAgIAlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNn
Owo+ICAgCWludCBpOwo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
