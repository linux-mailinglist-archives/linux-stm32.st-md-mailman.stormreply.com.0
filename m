Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FC546F1F8
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Dec 2021 18:32:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD261C5F1EA;
	Thu,  9 Dec 2021 17:32:40 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4906CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Dec 2021 17:32:39 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id o13so10916850wrs.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Dec 2021 09:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MnZ8XxoV/JNSKycvbGgmmnjtRwN6D7AwRUUOOMU+Mdw=;
 b=OXy7hbkQO4VBUZfxujencxRfCDtrWn8l6ADXaQvtZONpuVXUqGlbnDZjZ6MYuMK1kz
 Ib3+YPOGQf+l6YXBcy77E5yJhWCLMJLfnSc+oILTWxWFa2l4sODvgwlLmizQlFSkQVGZ
 Q8wvY/71JnyrCRlesbrXOThx1t+k9w6VSJrDRdVAeAIeHjlHKYQIJAdHfu8s8j0CgF8C
 8WD6l2kzyF4IYzuoSIiIJSf4FZPrv0C525Yge9d8DrcLl3zkupxnFmoq75rR/0xMCHZf
 4cKv2Of8mh0o1luLsCFTPJsObWh1beMOJpmmJm8RUsJNaRoEKNqCrjcM+26S9S2rBzr1
 TZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MnZ8XxoV/JNSKycvbGgmmnjtRwN6D7AwRUUOOMU+Mdw=;
 b=U+kdmZLqLTDSM7MBn+HBYsntPvPOZKNrxjkRd0U+dIOeUR8e0kK3RavjEDVzfMr8F/
 olPksMJPVR2GIgEEGRzwnOe6E6cuoSIdEiFY4vVwKwS6EXK4yWuxcbgshMBHTDuwAgOX
 pOv5SdDkQ+EWvkiPSo35Tx0CPW0T/j3frCuRhSl/I5ydB2Fwb7/azwe6P1ksvUK9/dYL
 5+4aA8y2Krs9fDt5+54ptdwxTGhVO/MzntvoXX6cpQTwAXWtHbLnhAM2/Ycl35CXh20m
 7z0g+4R4RFgv+MlOKa32Dba5xiT7wbRqUi4SlbOwVwKQv6OLBesqVyCJ8lrYY7P1Uw6E
 9aPw==
X-Gm-Message-State: AOAM5303TWHCI0hPKqbGjzJdggwq/WfBmBeQOmzDV2s/jbOBfSpTjRVH
 /Psa0wJdlxsk4j3vmQEeD9L4Eg==
X-Google-Smtp-Source: ABdhPJwEZnAMTP1IrzgOOydDuBQdzc5f1/tqdbw72jT2SJXr29DrudN2m4jy01eVW1SRHN131+SAhQ==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr8053459wrs.435.1639071159488; 
 Thu, 09 Dec 2021 09:32:39 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id d188sm9692560wmd.3.2021.12.09.09.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 09:32:39 -0800 (PST)
To: Rob Herring <robh@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Saenz Julienne <nsaenzjulienne@suse.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
References: <20211206174133.2296265-1-robh@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c676e23c-3c44-c28c-d572-499fe8d4ee8f@linaro.org>
Date: Thu, 9 Dec 2021 17:32:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211206174133.2296265-1-robh@kernel.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: Add missing 'reg'
	property
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

CgpPbiAwNi8xMi8yMDIxIDE3OjQxLCBSb2IgSGVycmluZyB3cm90ZToKPiBXaXRoICd1bmV2YWx1
YXRlZFByb3BlcnRpZXMnIHN1cHBvcnQgaW1wbGVtZW50ZWQsIHRoZSBmb2xsb3dpbmcgd2Fybmlu
Z3MKPiBhcmUgZ2VuZXJhdGVkIGluIHRoZSBudm1lbSBleGFtcGxlczoKPiAKPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0uZXhhbXBsZS5kdC55
YW1sOiBlZnVzZUAxZmZmNzgwMDogVW5ldmFsdWF0ZWQgcHJvcGVydGllcyBhcmUgbm90IGFsbG93
ZWQgKCdyZWcnIHdhcyB1bmV4cGVjdGVkKQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9udm1lbS9ybWVtLmV4YW1wbGUuZHQueWFtbDogbnZyYW1AMTAwMDAwMDA6IFVuZXZhbHVh
dGVkIHByb3BlcnRpZXMgYXJlIG5vdCBhbGxvd2VkICgncmVnJyB3YXMgdW5leHBlY3RlZCkKPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJhbS5leGFtcGxl
LmR0LnlhbWw6IG52cmFtQDFlZmYwMDAwOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3Qg
YWxsb3dlZCAoJ3JlZycgd2FzIHVuZXhwZWN0ZWQpCj4gCj4gQWRkIHRoZSBtaXNzaW5nICdyZWcn
IHByb3BlcnR5IGRlZmluaXRpb24uCj4gCj4gQ2M6IFNyaW5pdmFzIEthbmRhZ2F0bGEgPHNyaW5p
dmFzLmthbmRhZ2F0bGFAbGluYXJvLm9yZz4KPiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVs
aW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9y
Z3VlQGZvc3Muc3QuY29tPgo+IENjOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gQ2M6IFNhZW56IEp1bGllbm5lIDxuc2FlbnpqdWxpZW5uZUBzdXNlLmRlPgo+IENjOiBGYWJy
aWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiBDYzogbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgoKQXBwbGllZCB0aGFua3MsCgotLXNyaW5pCj4gLS0tCj4gICBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJhbS55YW1sICAgICB8IDMgKysrCj4g
ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55YW1sICAgICAg
ICAgICB8IDMgKysrCj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
c3Qsc3RtMzItcm9tZW0ueWFtbCB8IDMgKysrCj4gICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vYnJjbSxudnJhbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL252bWVtL2JyY20sbnZyYW0ueWFtbAo+IGluZGV4IDU4ZmY2YjBiZGIxYS4uOGMzZjBjZDIy
ODIxIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1l
bS9icmNtLG52cmFtLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vYnJjbSxudnJhbS55YW1sCj4gQEAgLTI0LDYgKzI0LDkgQEAgcHJvcGVydGllczoK
PiAgICAgY29tcGF0aWJsZToKPiAgICAgICBjb25zdDogYnJjbSxudnJhbQo+ICAgCj4gKyAgcmVn
Ogo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4gICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNl
Cj4gICAKPiAgIGV4YW1wbGVzOgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vcm1lbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3JtZW0ueWFtbAo+IGluZGV4IDFkODVhMGEzMDg0Ni4uYTRhNzU1ZGNmYzQz
IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9y
bWVtLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0v
cm1lbS55YW1sCj4gQEAgLTE5LDYgKzE5LDkgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAgICAt
IHJhc3BiZXJyeXBpLGJvb3Rsb2FkZXItY29uZmlnCj4gICAgICAgICAtIGNvbnN0OiBudm1lbS1y
bWVtCj4gICAKPiArICByZWc6Cj4gKyAgICBtYXhJdGVtczogMQo+ICsKPiAgICAgbm8tbWFwOgo+
ICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcKPiAgICAg
ICBkZXNjcmlwdGlvbjoKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbnZtZW0vc3Qsc3RtMzItcm9tZW0ueWFtbAo+IGluZGV4IGE0OGM4ZmE1NmJj
ZS4uNDQ4YTI2NzhkYzYyIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9udm1lbS9zdCxzdG0zMi1yb21lbS55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL252bWVtL3N0LHN0bTMyLXJvbWVtLnlhbWwKPiBAQCAtMjQsNiAr
MjQsOSBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAgLSBzdCxzdG0zMmY0LW90cAo+ICAgICAgICAg
LSBzdCxzdG0zMm1wMTUtYnNlYwo+ICAgCj4gKyAgcmVnOgo+ICsgICAgbWF4SXRlbXM6IDEKPiAr
Cj4gICBwYXR0ZXJuUHJvcGVydGllczoKPiAgICAgIl4uKkBbMC05YS1mXSskIjoKPiAgICAgICB0
eXBlOiBvYmplY3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
