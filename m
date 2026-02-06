Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOWHADG6hWmOFgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 10:53:53 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4AFC428
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 10:53:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FCBCC87EDD;
	Fri,  6 Feb 2026 09:53:52 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95045C58D7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 09:53:50 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a7a9b8ed69so20517445ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Feb 2026 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770371629; x=1770976429;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
 b=BcuLIjCAWDkSV+VVxZaWugoSB8dTIil/Ug4gNCHUieeNZnij5sVNjUuBCs4l1/J0Ye
 WDcfJ13Q/fiw7pTAQ+p6X1kK7DyKWbQXqW25OSaxiGqfHUztWyA+F1vys2MXa9eWz4rH
 UH0l28bQk0k6krTiYBw4gMv8Jlu9zu7zMHtWc2/IXiFD3yXj6b4LEDdmyJFoWHQKXulI
 RLrxKY+HvUQ5cu4IUeO7gI/0fkaw2V/Vte86dFtTv7Kc9FYglJWhCaVJ3d3iHQpYEOx/
 vIh7Q3SAwyRfHRRFleoK++/4QyflOf2VAp4FeXDf3v75XCvh03dG3ypNuD29nDGh7QjB
 MhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770371629; x=1770976429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpEDLnYj95OpOlLlWla7+a1PBaolL4JOvRD2mY4U/kc=;
 b=XEjZym8HyvoqVsqlmkMUgVuwIaKvmmJZMvq2DIH9LDCLQ5U7i3tSiUSB4UYJBrpkQM
 5XyoXQTikEP4SOmarp1Wm3ipfel1hseeeaQjh1umVmCXnbxNkRrOwJ0uDuIeFZv7GfbB
 Z0wmNt+j+8J5HxwjzEIYcDo3n8z+7x+GbA4tWdBtxVqJtHF31ZLtCEjnTODav5Z6mSim
 WfPy5WmBzRJZUVKy1DKSa4YiCDv8bBi/F/SfcektgcZEcPTBN5TUzAYKsp0ZIdx1ETOK
 nOjRmwQV88jXteA5uEaTwpXEjZFB3dIw6J4UucOL47Z+wB+lU7upWKUsKCgCuIPQoqbT
 h7UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0gCFwidOhOH2/q07tsbxt2YPCQUiIubDUnDEjI67FhqhQGL9IMaGSV7DAn07wFhY1CfORdzUqDK+pgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YybeBxeDrbPMLUEjCX2xRySw5ETie4NcsCBzetAl5KPdaZahZzP
 4pLtLTWvTPSK5o7NDsCjAQDk5IIaMJlwTQIMwrjBcRdk/SZgWFWnA1i1
X-Gm-Gg: AZuq6aL1S3nOApFwhmcY6SUz/qYRf7urCw7dsrwRr7xJm5enaq43QN1cvJbvuCLHrzG
 QpGm19un4p6vju5E4TSZM3G+4+cERSI1hiAvh2mR2uZX2yFcg1VLQ0A6qjl4DQ8tmArTj1FXgC4
 N1E4FE8caINidPEgh8G9iaGW5ffRlomR4yHsnkOgOVO4yq4EjviC7MMuvUL2Limy2uo152orHlZ
 AGD91IJEZc2REITy2bADjJpU1Fx3wnrarHdmnvF+c4YPVjbY9Q+/9vs5YXenqsXRIdndL0zOODc
 hL98bQMZheK4d4KzMPofIU30BVdxMotZgZyPV2uk6TVfigWQUw6u2ueyAnvgXsCP/aSBaKIrsYl
 HSYQBzUEDxrCJwofjzA5fwtRLxcgz1QzhnaKK6P//SIpMQjTzfAgjngRtctZyxDHfksZH4Dp8sa
 ILKKas6olM0JDjpyvXUDv+AQTUFWkcJbgcsC2rxmMIylFb9EVVr+CN+nShKXxteuKI
X-Received: by 2002:a17:902:cf4c:b0:295:592f:94a3 with SMTP id
 d9443c01a7336-2a9519a19e0mr23066635ad.48.1770371628931; 
 Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a9521b9761sm19141145ad.48.2026.02.06.01.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 01:53:48 -0800 (PST)
Message-ID: <4281a709-04a4-4b9f-b511-bff0a332f9bd@gmail.com>
Date: Fri, 6 Feb 2026 17:53:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260205014006.735408-1-a0987203069@gmail.com>
 <20260205014006.735408-4-a0987203069@gmail.com>
 <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYRlKk-cCIhqGWX7@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v11 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8FF4AFC428
X-Rspamd-Action: no action

Ck9uIDIvNS8yMDI2IDU6MzggUE0sIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiBIaSwK
Pgo+IE9uIFRodSwgRmViIDA1LCAyMDI2IGF0IDA5OjQwOjA1QU0gKzA4MDAsIEpvZXkgTHUgd3Jv
dGU6Cj4+ICsKPj4gK3N0cnVjdCBudnRfcHJpdl9kYXRhIHsKPj4gKwlzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2Owo+IFRoaXMgbG9va3MgdG8gbWUgbGlrZSBpdCdzIHdyaXRlLW9ubHksIGRv
ZXMgaXQgc2VydmUgYSB1c2VmdWwgcHVycG9zZT8KPgo+PiArCXN0cnVjdCByZWdtYXAgKnJlZ21h
cDsKPiBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkIG91dHNpZGUgb2YgbnZ0X2dtYWNfc2V0
dXAoKS4KPgo+PiArfTsKPiBHaXZlbiB0aGUgYWJvdmUgdHdvIGNvbW1lbnRzLCBkbyB5b3UgYWN0
dWFsbHkgbmVlZCBzdHJ1Y3QgbnZ0X3ByaXZfZGF0YSA/CllvdSBhcmUgcmlnaHQuIEknbGwgZHJv
cCBpdCBpbiB0aGUgbmV4dCByZXZpc2lvbi4KPgo+PiArCj4+ICtzdGF0aWMgc3RydWN0IG52dF9w
cml2X2RhdGEgKgo+PiArbnZ0X2dtYWNfc2V0dXAoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
diwgc3RydWN0IHBsYXRfc3RtbWFjZW5ldF9kYXRhICpwbGF0KQo+PiArewo+PiArCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+ICsJc3RydWN0IG52dF9wcml2X2RhdGEgKmJzcF9w
cml2Owo+PiArCXBoeV9pbnRlcmZhY2VfdCBwaHlfbW9kZTsKPj4gKwl1MzIgbWFjaWQsIGFyZywg
cmVnOwo+PiArCXUzMiB0eF9kZWxheV9zdGVwOwo+PiArCXUzMiByeF9kZWxheV9zdGVwOwo+PiAr
CXUzMiBtaXNjcjsKPj4gKwo+PiArCWJzcF9wcml2ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9m
KCpic3BfcHJpdiksIEdGUF9LRVJORUwpOwo+PiArCWlmICghYnNwX3ByaXYpCj4+ICsJCXJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOwo+PiArCj4+ICsJYnNwX3ByaXYtPnJlZ21hcCA9Cj4+ICsJCXN5
c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGVfYXJncyhkZXYtPm9mX25vZGUsICJudXZvdG9u
LHN5cyIsIDEsICZtYWNpZCk7Cj4+ICsJaWYgKElTX0VSUihic3BfcHJpdi0+cmVnbWFwKSkKPj4g
KwkJcmV0dXJuIEVSUl9QVFIoZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYnNwX3ByaXYtPnJl
Z21hcCksCj4+ICsJCQkJICAgICAiRmFpbGVkIHRvIGdldCBzeXMgcmVnaXN0ZXJcbiIpKTsKPj4g
KwlpZiAobWFjaWQgPiAxKSB7Cj4+ICsJCWRldl9lcnIoZGV2LCAiSW52YWxpZCBzeXMgYXJndW1l
bnRzXG4iKTsKPj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4+ICsJfQo+PiArCj4+ICsJ
aWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwgInR4LWludGVybmFsLWRlbGF5
LXBzIiwgJmFyZykpIHsKPj4gKwkJdHhfZGVsYXlfc3RlcCA9IDA7Cj4+ICsJfSBlbHNlIHsKPj4g
KwkJaWYgKGFyZyA8PSAyMDAwKSB7Cj4+ICsJCQl0eF9kZWxheV9zdGVwID0gKGFyZyA9PSAyMDAw
KSA/IDB4ZiA6IChhcmcgLyBOVlRfUEFUSF9ERUxBWV9TVEVQKTsKPj4gKwkJCWRldl9kYmcoZGV2
LCAiU2V0IFR4IHBhdGggZGVsYXkgdG8gMHgleFxuIiwgdHhfZGVsYXlfc3RlcCk7Cj4+ICsJCX0g
ZWxzZSB7Cj4+ICsJCQlkZXZfZXJyKGRldiwgIkludmFsaWQgVHggcGF0aCBkZWxheSBhcmd1bWVu
dC5cbiIpOwo+PiArCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4+ICsJCX0KPj4gKwl9Cj4+
ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKGRldi0+b2Zfbm9kZSwgInJ4LWludGVybmFsLWRl
bGF5LXBzIiwgJmFyZykpIHsKPj4gKwkJcnhfZGVsYXlfc3RlcCA9IDA7Cj4+ICsJfSBlbHNlIHsK
Pj4gKwkJaWYgKGFyZyA8PSAyMDAwKSB7Cj4+ICsJCQlyeF9kZWxheV9zdGVwID0gKGFyZyA9PSAy
MDAwKSA/IDB4ZiA6IChhcmcgLyBOVlRfUEFUSF9ERUxBWV9TVEVQKTsKPj4gKwkJCWRldl9kYmco
ZGV2LCAiU2V0IFJ4IHBhdGggZGVsYXkgdG8gMHgleFxuIiwgcnhfZGVsYXlfc3RlcCk7Cj4+ICsJ
CX0gZWxzZSB7Cj4+ICsJCQlkZXZfZXJyKGRldiwgIkludmFsaWQgUnggcGF0aCBkZWxheSBhcmd1
bWVudC5cbiIpOwo+PiArCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4+ICsJCX0KPj4gKwl9
Cj4gRWFjaCBvZiB0aGVzZSBjb3VsZCBiZSBtb3ZlZCBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb246
Cj4KPiBzdGF0aWMgaW50IG52dF9nbWFjX2dldF9kZWxheShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IGNoYXIgKnByb3BlcnR5KQo+IHsKPiAJdTMyIGFyZzsKPgo+IAlpZiAob2ZfcHJvcGVydHlf
cmVhZF91MzIoZGV2LT5vZl9ub2RlLCBwcm9wZXJ0eSwgJmFyZykpCj4gCQlyZXR1cm4gMDsKPgo+
IAlpZiAoYXJnID4gMjAwMCkgewo+IAkJZGV2X2VycihkZXYsICJJbnZhbGlkICVzIGFyZ3VtZW50
LlxuIiwgcHJvcGVydHkpOwo+IAkJcmV0dXJuIC1FSU5WQUw7Cj4gCX0KPgo+IAlpZiAoYXJnID09
IDIwMDApCj4gCQlyZXR1cm4gMTU7Cj4KPiAJcmV0dXJuIGFyZyAvIE5WVF9QQVRIX0RFTEFZX1NU
RVA7Cj4gfQo+Cj4gdGhlbjoKPiAJaW50IHJldDsKPgo+IAlyZXQgPSBudnRfZ21hY19nZXRfZGVs
YXkoZGV2LCAidHgtaW50ZXJuYWwtZGVsYXktcHMiKTsKPiAJaWYgKHJldCA8IDApCj4gCQlyZXR1
cm4gRVJSX1BUUihyZXQpOwo+Cj4gCXR4X2RlbGF5ID0gcmV0Owo+Cj4gCXJldCA9IG52dF9nbWFj
X2dldF9kZWxheShkZXYsICJyeC1pbnRlcm5hbC1kZWxheS1wcyIpOwo+IAlpZiAocmV0IDwgMCkK
PiAJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4KPiAJcnhfZGVsYXkgPSByZXQ7CkknbGwgdXBkYXRl
IHRoZSBjb2RlIGFjY29yZGluZyB0byB5b3VyIHN1Z2dlc3Rpb25zLgo+PiArCj4+ICsJbWlzY3Ig
PSAobWFjaWQgPT0gMCkgPyBOVlRfUkVHX1NZU19HTUFDME1JU0NSIDogTlZUX1JFR19TWVNfR01B
QzFNSVNDUjsKPj4gKwlyZWdtYXBfcmVhZChic3BfcHJpdi0+cmVnbWFwLCBtaXNjciwgJnJlZyk7
Cj4+ICsJcmVnICY9IH4oTlZUX1RYX0RFTEFZX01BU0sgfCBOVlRfUlhfREVMQVlfTUFTSyk7Cj4+
ICsKPj4gKwlpZiAob2ZfZ2V0X3BoeV9tb2RlKHBkZXYtPmRldi5vZl9ub2RlLCAmcGh5X21vZGUp
KSB7Cj4+ICsJCWRldl9lcnIoZGV2LCAibWlzc2luZyBwaHkgbW9kZSBwcm9wZXJ0eVxuIik7Cj4+
ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+PiArCX0KPj4gKwo+PiArCXN3aXRjaCAocGh5
X21vZGUpIHsKPj4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9SR01JSToKPj4gKwljYXNlIFBI
WV9JTlRFUkZBQ0VfTU9ERV9SR01JSV9JRDoKPj4gKwljYXNlIFBIWV9JTlRFUkZBQ0VfTU9ERV9S
R01JSV9SWElEOgo+PiArCWNhc2UgUEhZX0lOVEVSRkFDRV9NT0RFX1JHTUlJX1RYSUQ6Cj4+ICsJ
CXJlZyAmPSB+TlZUX01JU0NSX1JNSUk7Cj4+ICsJCWJyZWFrOwo+PiArCWNhc2UgUEhZX0lOVEVS
RkFDRV9NT0RFX1JNSUk6Cj4+ICsJCXJlZyB8PSBOVlRfTUlTQ1JfUk1JSTsKPj4gKwkJYnJlYWs7
Cj4+ICsJZGVmYXVsdDoKPj4gKwkJZGV2X2VycihkZXYsICJVbnN1cHBvcnRlZCBwaHktbW9kZSAo
JWQpXG4iLCBwaHlfbW9kZSk7Cj4+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+PiArCX0K
Pj4gKwo+PiArCWlmICghKHJlZyAmIE5WVF9NSVNDUl9STUlJKSkgewo+PiArCQlyZWcgfD0gRklF
TERfUFJFUChOVlRfVFhfREVMQVlfTUFTSywgdHhfZGVsYXlfc3RlcCk7Cj4+ICsJCXJlZyB8PSBG
SUVMRF9QUkVQKE5WVF9SWF9ERUxBWV9NQVNLLCByeF9kZWxheV9zdGVwKTsKPiBZb3UgY2FuIG1v
dmUgdGhpcyBpbnNpZGUgdGhlIHN3aXRjaCBhYm92ZSB1bmRlciB0aGUgUkdNSUkgY2FzZS4gVGhl
c2VzCj4gZGVsYXlzIGFyZSwgYWZ0ZXIgYWxsLCBvbmx5IGZvciBSR01JSS4KR290IGl0LiBJJ2xs
IG1vdmUgdGhlbSBpbnRvIHRoZSBSR01JSSBjYXNlLgo+PiArCX0KPj4gKwo+PiArCXJlZ21hcF93
cml0ZShic3BfcHJpdi0+cmVnbWFwLCBtaXNjciwgcmVnKTsKPiBDb25zaWRlcjoKPgo+IAlyZWdt
YXBfdXBkYXRlX2JpdHMoYnNwX3ByaXYtPnJlZ21hcCwgbWlzY3IsCj4gCQkJICAgTlZUX1RYX0RF
TEFZX01BU0sgfCBOVlRfUlhfREVMQVlfTUFTSyB8Cj4gCQkJICAgTlZUX01JU0NSX1JNSUksIHJl
Zyk7Cj4KPj4gKwlwbGF0X2RhdCA9IGRldm1fc3RtbWFjX3Byb2JlX2NvbmZpZ19kdChwZGV2LCBz
dG1tYWNfcmVzLm1hYyk7Cj4+ICsJaWYgKElTX0VSUihwbGF0X2RhdCkpCj4+ICsJCXJldHVybiBQ
VFJfRVJSKHBsYXRfZGF0KTsKPj4gKwo+PiArCS8qIE51dm90b24gRFdNQUMgY29uZmlncyAqLwo+
PiArCXBsYXRfZGF0LT5jb3JlX3R5cGUgPSBEV01BQ19DT1JFX0dNQUM7Cj4gSXMgdGhlIGhhcmR3
YXJlIG5vdCBjb21wYXRpYmxlIHdpdGggYW55IG9mIHRoZSBjb21wYXRpYmxlIHR5cGVzIHRoYXQK
PiBkZXZtX3N0bW1hY19wcm9iZV9jb25maWdfZHQoKSB3aWxsIGF1dG9tYXRpY2FsbHkgc2V0IHRo
aXMgZm9yIHlvdT8KPiBXaGljaCB2ZXJzaW9uIG9mIHRoZSBjb3JlIGRvIHlvdSBoYXZlPwo+Cj4+
ICsJcGxhdF9kYXQtPnR4X2ZpZm9fc2l6ZSA9IDIwNDg7Cj4+ICsJcGxhdF9kYXQtPnJ4X2ZpZm9f
c2l6ZSA9IDQwOTY7Cj4gVGhlcmUgYXJlIHR4LWZpZm8tZGVwdGggLyByeC1maWZvLWRlcHRoIHBy
b3BlcnRpZXMgdGhhdCBjYW4gYmUgdXNlZCB0bwo+IGRlc2NyaWJlIHRoZXNlIGluIERULgo+Cj4+
ICsJcGxhdF9kYXQtPm11bHRpY2FzdF9maWx0ZXJfYmlucyA9IDA7Cj4+ICsJcGxhdF9kYXQtPnVu
aWNhc3RfZmlsdGVyX2VudHJpZXMgPSA4Owo+IElmIHRoaXMgY29yZSBpcyB2My41MCwgdjMuNzAg
b3IgdjMuNzIsIHRoZW4gdGhlcmUgYXJlCj4gc25wcyxtdWx0aWNhc3QtZmlsdGVyLWJpbnMgYW5k
IHNucHMscGVyZmVjdC1maWx0ZXItZW50cmllcyB3aGljaAo+IGNhbiBiZSB1c2VkIHRvIGRlc2Ny
aWJlIGJvdGggb2YgdGhlc2UuCj4KPiBUaGFua3MuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4K
ClRoaXMgR01BQyBpcyBiYXNlZCBvbiB2My43M2EuIFdoaWxlIHRoaXMgc3BlY2lmaWMgcmV2aXNp
b24gaXNu4oCZdCAKZXhwbGljaXRseSBkb2N1bWVudGVkIGluIHRoZSBjdXJyZW50IERUIGJpbmRp
bmcgWUFNTCwgdGhlIHJlbGV2YW50IEZJRk8gCnNpemluZyBhbmQgZmlsdGVyIGNhcGFiaWxpdGll
cyBtYXRjaCB0aGUgYmVoYXZpb3IgaW50cm9kdWNlZCBpbiBlYXJsaWVyIAp2My43MCsgY29yZXMu
CgpHaXZlbiB0aGF0LCBJIGFncmVlIGl0IG1ha2VzIHNlbnNlIHRvIGRlc2NyaWJlIHRoZXNlIHBh
cmFtZXRlcnMgdXNpbmcgCnRoZSBleGlzdGluZyBEVCBwcm9wZXJ0aWVzLgoKSSB3aWxsIHVwZGF0
ZSB0aGUgRFQgYW5kIGRyaXZlciBhY2NvcmRpbmdseSBpbiB0aGUgbmV4dCByZXZpc2lvbi4KCkpv
ZXkKCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
