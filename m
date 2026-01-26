Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGCUAPpDd2mMdQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:37:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D68718D
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 11:37:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 133FCC87EDC;
	Mon, 26 Jan 2026 10:37:45 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E088C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 10:37:43 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-48049955f7fso36773715e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 02:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769423862; x=1770028662;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
 b=mLxhqd0wpwqX50cP7oEc8XsOxQ7/Fke+bhumvfzaR7O8fdQWGvpaq+2or2NV3IcfJB
 Q/fYX5KSpgcKVBDZ2N5dAzL/of4b+9NgbdEBTvevkbbDK6maXQA2DcmALUrBMa8tmvkq
 Bt0iEgFklEhzI9grBmCqTR/1eiPjy3unlUYkaoIUyoeMYgUJQv7rO/wrKmPWjhTTrl8M
 SyXyb45wHpsNsWzjWmZhj33r/MQ1c6StbhaUAfP/qaFbGuxLDZKQhMuqYQorGplV1n5v
 DJu+pirp4YWVJz9CtsvJqKEPNM4Z7wyModhcni26baCLMRQtW9JtZidGftwwFa1cq57/
 GjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769423862; x=1770028662;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xkux+EitG9JzPydAe2E8YwQFUS9lBx4JpjL6QxsZSNw=;
 b=QlsAhDqiqL0sOYFYE0lOciEJvsAU1QFU52noslbB/h0aoDZUa0YOOS4IzbK3p5Tb+4
 7Y0H3kjgi1/GpcSUwPfE9mrtSGVD9sKbtFHKs8xuwNWl12xR3ty/vbBuRNO4UvJwMTbS
 9/KXbgSnhR6fL4D8ZSt1JP4beG6hwAnNDj0+NFuuioZLreAnkqrkT8DKeBt4/WfWYnCe
 0x78X02lbUcD1naouW0FOyo8mONUBBwWmPH7HlwozFKic9DCHtIrYRKzYAM5Ajef7nA/
 xDsRrY7M2MdC5qOgMP4Tciz3dzyi+daKzkQ9uC2b5xBofpP+HLofe0ms97wKhPRi3h1P
 UrYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXezFhNE51iNNZFPySmmXjpwkfbb/Mvio5akKegZkDj4Yt5CJ9MWJd3qOAVLJa293eov+c9gh3p4yIasw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVyKCN4HgunH08i4ZY9Tp9aNFF8JJg8ywTyNf/1IVlL7FBgXCQ
 6zADBJWrWgGzZCsXqxJBZxaviDC/JSItK3hNhB8VnsInK/6BumCE/6BB
X-Gm-Gg: AZuq6aIfmB1ZDL6ZGqf8zrtbV0AbKIo3mD6WFntE9HnV3Q3JowlWXQTfvuqS2K4DQRJ
 /E/MlTuhWzreStV/98seF/vKAdwidVOncMnO340cfJBKlorKHHyDQTd6MxgH+zJ08SKS0JPGvWz
 d3F3x99mWLZNHB1YbYerV886RiF23HWNl4AfTThyBlZ4cz/YFlmKxeUUsLAIpGFzE6NTwReamkE
 7GyuHeVsXBDc7czSuMn5e4p0WWu1y/cGfQnZQZACV8s2Gi4nk0VfP2nCXth9wv6XlLahQ/f2m3J
 pgLI0/7gcKPJjk7d5UxSzd1wMYd8G+uwug2vSSHDE1EqvQ9z2PDWyc7lrQqQngzMBnVgUE5MWxh
 ay3eWGUyXWa+2k8LHm78VpAHYI/kA9HoHSmYxNxnvOXb5QDFzH+3gyEmdvTJzmWRVAuL0eqqHKq
 SlJ5+YgN8DriMX8KgDOYd00W4fJMArt8/FUIyFw44xMbZ1rWfITOPlTxX2nYewJy4o/L+L8Zyng
 A8KeBf7DTxIJhztMwUBTtwn/HzJuNyEiebd839z4E7P52qjl2AoYai7TBys
X-Received: by 2002:a05:600c:35c4:b0:47e:e9c9:23bc with SMTP id
 5b1f17b1804b1-4805cf673f5mr69370895e9.30.1769423862239; 
 Mon, 26 Jan 2026 02:37:42 -0800 (PST)
Received: from ?IPV6:2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42?
 (2a02-8440-260e-5ad0-867f-b0c6-e80c-5b42.rev.sfr.net.
 [2a02:8440:260e:5ad0:867f:b0c6:e80c:5b42])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d6160d2sm104298055e9.2.2026.01.26.02.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:37:41 -0800 (PST)
Message-ID: <ed300810-14c9-40de-b50b-f60cd4241bb7@gmail.com>
Date: Mon, 26 Jan 2026 11:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, jens.wiklander@linaro.org
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20260123-debug_bus-v5-12-90b670844241@foss.st.com>
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 12/12] pinctrl: stm32: add firewall
 checks before probing the HDP driver
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,arm.com,linaro.org,kernel.org,linux.dev,gmail.com];
	FORGED_SENDER(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gatien.chevallier@foss.st.com,m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[legofficclement@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 7C6D68718D
X-Rspamd-Action: no action

SGkgR2F0aWVuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gKCk9uIDEvMjMvMjYgMTE6MzkgQU0s
IEdhdGllbiBDaGV2YWxsaWVyIHdyb3RlOgo+IEJlY2F1c2UgdGhlIEhEUCBwZXJpcGhlcmFsIGJv
dGggZGVwZW5kcyBvbiBkZWJ1ZyBhbmQgZmlyZXdhbGwKPiBjb25maWd1cmF0aW9uLCB3aGVuIENP
TkZJR19TVE0zMl9GSVJFV0FMTCBpcyBwcmVzZW50LCB1c2UgdGhlCj4gc3RtMzIgZmlyZXdhbGwg
ZnJhbWV3b3JrIHRvIGJlIGFibGUgdG8gY2hlY2sgdGhlc2UgY29uZmlndXJhdGlvbiBhZ2FpbnN0
Cj4gdGhlIHJlbGV2YW50IGNvbnRyb2xsZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdhdGllbiBD
aGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4KPiAtLS0KPiAgIGRyaXZl
cnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jIHwgMTQgKysrKysrKysrKysrKysK
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jIGIvZHJpdmVycy9waW5jdHJs
L3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMKPiBpbmRleCAwYjFkZmYwMWUwNGMuLmNjZTQ3N2U4
NmVmOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1o
ZHAuYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCj4g
QEAgLTQsNiArNCw3IEBACj4gICAgKiBBdXRob3I6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gZm9yIFNUTWljcm9lbGVjdHJvbmljcy4KPiAgICAqLwo+
ICAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9m
aXJld2FsbF9kZXZpY2UuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KPiAgICNpbmNsdWRl
IDxsaW51eC9ncGlvL2RyaXZlci5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2dwaW8vZ2VuZXJpYy5o
Pgo+IEBAIC00Niw5ICs0NywxMSBAQCBzdHJ1Y3Qgc3RtMzJfaGRwIHsKPiAgIAl2b2lkIF9faW9t
ZW0gKmJhc2U7Cj4gICAJc3RydWN0IGNsayAqY2xrOwo+ICAgCXN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bF9kZXY7Cj4gKwlzdHJ1Y3Qgc3RtMzJfZmlyZXdhbGwgKmZpcmV3YWxsOwo+ICAgCXN0cnVj
dCBncGlvX2dlbmVyaWNfY2hpcCBncGlvX2NoaXA7Cj4gICAJdTMyIG11eF9jb25mOwo+ICAgCXUz
MiBncG9zZXRfY29uZjsKPiArCWludCBuYl9maXJld2FsbF9lbnRyaWVzOwo+ICAgCWNvbnN0IGNo
YXIgKiBjb25zdCAqZnVuY19uYW1lOwo+ICAgfTsKPiAgIAo+IEBAIC02MTUsNiArNjE4LDEzIEBA
IHN0YXRpYyBpbnQgc3RtMzJfaGRwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCWhkcC0+ZGV2ID0gZGV2Owo+ICAgCj4gKwlpZiAo
SVNfRU5BQkxFRChDT05GSUdfU1RNMzJfRklSRVdBTEwpKSB7Cj4gKwkJZXJyID0gc3RtMzJfZmly
ZXdhbGxfZ2V0X2dyYW50X2FsbF9hY2Nlc3MoZGV2LCAmaGRwLT5maXJld2FsbCwKPiArCQkJCQkJ
CSAgJmhkcC0+bmJfZmlyZXdhbGxfZW50cmllcyk7Cj4gKwkJaWYgKGVycikKPiArCQkJcmV0dXJu
IGVycjsKPiArCX0KPiArCj4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRwKTsKPiAg
IAo+ICAgCWhkcC0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAw
KTsKPiBAQCAtNjcwLDggKzY4MCwxMiBAQCBzdGF0aWMgaW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgc3RhdGljIHZvaWQgc3RtMzJfaGRwX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgewo+ICAgCXN0cnVjdCBzdG0zMl9o
ZHAgKmhkcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsJaW50IGk7Cj4gICAKPiAg
IAl3cml0ZWxfcmVsYXhlZChIRFBfQ1RSTF9ESVNBQkxFLCBoZHAtPmJhc2UgKyBIRFBfQ1RSTCk7
Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IGhkcC0+bmJfZmlyZXdhbGxfZW50cmllczsgaSsrKQo+
ICsJCXN0bTMyX2ZpcmV3YWxsX3JlbGVhc2VfYWNjZXNzKCZoZHAtPmZpcmV3YWxsW2ldKTsKPiAg
IH0KPiAgIAo+ICAgc3RhdGljIGludCBzdG0zMl9oZHBfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gCgpSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50
QGdtYWlsLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
