Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F0F47EA6
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 11:41:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 550CED0AAD8
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 09:41:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33AC0D09CFC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 09:41:36 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5H9aLRw019974; Mon, 17 Jun 2019 11:41:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=WZehqQgVkFhvfsisL+y7tm5FQFwE1NGQqYaPz62rGtM=;
 b=PnnSa2cRQ0JYexC1sWAn2LHmqBAp8oVT19QL/zKidBH9SWP9MlKIGAt4eLLHJSTnuURN
 y42bVuO5r78/RnFvzgdT8WV/ep1hzovwvSAq1ZVl73oQCK/KZkuHJXPTLuUW2XZTtKVW
 mYbLkpWJdSzv2HvxUazi5j9/b/qSGLtjQ8V2QwEdLzZ3GFBvkBvjdAf4TkC2wPNFoeI6
 7OiqjW9ZNw3Vc4LSYaxESgUds88ExrZJ9GOfCpBF71vSM5iW2f1SA6o7qtG3jT2/xGIE
 3usljuP2sG07MqqfzmgzMZ8oSgUy31rlR92zhPoMolKmXk6vmL2lE6nn9OFk6j/jcWwI Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4qjhsq6w-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 11:41:25 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 20C4B3A;
 Mon, 17 Jun 2019 09:41:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1F1A25C4;
 Mon, 17 Jun 2019 09:41:23 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 17 Jun
 2019 11:41:23 +0200
To: =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, Fabrice Gasnier
 <fabrice.gasnier@st.com>
References: <1558450998-13451-1-git-send-email-yannick.fertre@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <fe5206ed-4e6b-1b2a-0283-bdc8e44270dc@st.com>
Date: Mon, 17 Jun 2019 11:41:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1558450998-13451-1-git-send-email-yannick.fertre@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add power supply of
 rm68200 on stm32mp157c-ev1
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

SGkgWWFubmljawoKT24gNS8yMS8xOSA1OjAzIFBNLCBZYW5uaWNrIEZlcnRyw6kgd3JvdGU6Cj4g
VGhpcyBwYXRjaCBhZGRzIGEgbmV3IHByb3BlcnR5IChwb3dlci1zdXBwbHkpIHRvIHBhbmVsIHJt
NjgyMDAgKHJheWRpdW0pCj4gb24gc3RtMzJtcDE1N2MtZXYxLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVAc3QuY29tPgo+IC0tLQo+ICAgYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWV2MS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzCj4g
aW5kZXggOGVmMmNiMC4uNTBmMzI2MyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMm1wMTU3Yy1ldjEuZHRzCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mt
ZXYxLmR0cwo+IEBAIC0xMjcsNiArMTI3LDcgQEAKPiAgIAkJcmVnID0gPDA+Owo+ICAgCQlyZXNl
dC1ncGlvcyA9IDwmZ3Bpb2YgMTUgR1BJT19BQ1RJVkVfTE9XPjsKPiAgIAkJYmFja2xpZ2h0ID0g
PCZwYW5lbF9iYWNrbGlnaHQ+Owo+ICsJCXBvd2VyLXN1cHBseSA9IDwmdjN2Mz47Cj4gICAJCXN0
YXR1cyA9ICJva2F5IjsKPiAgIAo+ICAgCQlwb3J0IHsKPiAKCkFwcGxpZWQgb24gc3RtMzItbmV4
dC4KClRoYW5rcy4KQWxleApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
