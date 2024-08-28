Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2610962EF8
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Aug 2024 19:50:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C2F1C6C855;
	Wed, 28 Aug 2024 17:50:56 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13378C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Aug 2024 17:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1724867436; x=1725472236; i=markus.elfring@web.de;
 bh=LtVGxGVh9TDYbEyEfnGiuVp5FC+9j4hnBSLVAPE83ac=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kGW+CQYNBSQqkuBaq1GlK8XiqaM5ncEdFXGuAcs0O7H1i+c2bdl7L1yFVfWiu2dU
 mum4MNqLpcUX8NUEWIjRD9BzwK7yk3l8bV4ro7fILPsMWYNOVlhvr1QssDf4Vfa0l
 hH3orzUY//aOozH6tfT/xmjUiXssyfjGgxGj+2bzjnRNvv7CEd4rYwFflv1YTb08g
 rMJMt6/zueAOM03ZK33l4LpoKkYZPdYu5Qgd2R0cG+/w/IqDz58F6hb7k6IhoQKIW
 W0t4pbTLyYkmQk6HXshTeZAOx6owbktrrG0HxuyHDCx7YSiSTgfmFyllSMH1cAFvu
 x+5tEZKE4y2iytkekg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MSqXS-1sWcoE0zIU-00U7H7; Wed, 28
 Aug 2024 19:50:36 +0200
Message-ID: <7eb981c3-4a5c-4173-a62a-7180acb9f299@web.de>
Date: Wed, 28 Aug 2024 19:50:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>, coresight@lists.linaro.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 James Clark <james.clark@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mike Leach <mike.leach@linaro.org>, Rob Herring <robh@kernel.org>,
 Suzuki Poulouse <suzuki.poulose@arm.com>
References: <20240828012706.543605-3-quic_jiegan@quicinc.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240828012706.543605-3-quic_jiegan@quicinc.com>
X-Provags-ID: V03:K1:rjkUlUIXEG7BqyN36JwLp90ca4DoKkKrF4nYX/VqHLE5YYvtHik
 xl07Ou3U4ZCub7FNZ7SJQf0ONV00l3DsHMyLW2l+rBHK2wZRMOmnuhecYgCH/oEJyv3TPEy
 HZVG5C8we3bkP8rPl1sXSWg5Jjt0zjLmr4uPbIhAU+uqJ8Wa7P/rnh1MceCoRXg3LlDQdSS
 kleG43kfF8Koyy8NewxuQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4H5l6eoKx5Q=;NFCpzLicFw+OLKbYbZGbHV7+FNE
 N3E/yZCNcIbOOsqPolIn8RztVSC7/ZadGIvqR3vkHSk7zVlFuE+akgHqp+WzFb/pJ4y+08wGb
 V7jhybsGk1exi9S2h0csm3WIYL8Lc0oxMBdxBDPsgPai9lWu4xZYfBmwMc5UBlbjU7N9FQVEy
 Pq73arExOmIsG+WppiAjQK8dl11llbnLV4sl2juYnegn4jI46kgHHRBoAkLeZH4eTASldtHAm
 KHIuM0HnKO7XlBfVV2P47mzYgX1d6NAkyMCB/VXATNscn/+XV/1dSSX+2uNklPitr+gAS7hFl
 JqZvItzuQPMwBo9DmP+MAUeifQxgtuB4Y0cnnbMYM9k/maRdR3hN9Vlaz9ic/oIRpvBWDY/Rk
 NFDIrHzwrHkzd7qCxNE9oP3F92gIJOnfTl4piCTxoHQM4JXZOev8wX48ANbyq4tibD+mjfjb2
 ZFXi8q7ch/5gIQpf9zuILyHsJwVPjQTrU1o1CG9IdDkiCxYtCMamjJUUNo37TBV/sZ5XRp8gv
 tVHcSJBtacjN6gy5jNmc85wD3ozy7YftWPxEjplqGXmsB5QxGvmJLjHJl5VxtDzEPNWMoKdQQ
 avk4uRkCR515KOGmm+TI0uWX3kdorOB95/iU3BGztRQyvE3fNlo8U1pePkuWIdF5FRle6cYNV
 ml0QMz1WtwUTN9fo1cHHjHikMyZ8ER7DIz/usbiTBZEBBhbYcEKP+h6YtKz+/JAjbXFu9T/IN
 Ufxp+aFrPpfVRcWdKhce5K7hOqDBQdoPGjSBkhYYeJ4AgBkNaZAKDk/H/76sMvyq3N9a1iIxN
 C8uSjzQq2wJD68Ma2k6eY+Lw==
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Song Chai <quic_songchai@quicinc.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, Tao Zhang <quic_taozha@quicinc.com>
Subject: Re: [Linux-stm32] [PATCH v4 2/5] Coresight: Add trace_id function
 to retrieving the trace ID
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

4oCmCj4gKysrIGIvZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1zeXNmcy5j
Cj4gQEAgLTE2OCw2ICsxNjgsNyBAQCBpbnQgY29yZXNpZ2h0X2VuYWJsZV9zeXNmcyhzdHJ1Y3Qg
Y29yZXNpZ2h0X2RldmljZSAqY3NkZXYpCj4gIAlpbnQgY3B1LCByZXQgPSAwOwo+ICAJc3RydWN0
IGNvcmVzaWdodF9kZXZpY2UgKnNpbms7Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFkICpwYXRoOwo+ICsJ
c3RydWN0IGNzX3NpbmtfZGF0YSAqc2lua19kYXRhOwrigKYKCiogSG93IGRvIHlvdSB0aGluayBh
Ym91dCB0byB1c2UgdGhlIGF0dHJpYnV0ZSDigJxfX2ZyZWUoa2ZyZWUp4oCdIGF0IG1vcmUgcGxh
Y2VzIGFjY29yZGluZ2x5PwogIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEx
LXJjNS9zb3VyY2UvaW5jbHVkZS9saW51eC9zbGFiLmgjTDI4MgoKKiBXb3VsZCB5b3UgbGlrZSB0
byByZWR1Y2UgdGhlIHNjb3BlIGZvciBzdWNoIGEgbG9jYWwgdmFyaWFibGU/CgoKUmVnYXJkcywK
TWFya3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
