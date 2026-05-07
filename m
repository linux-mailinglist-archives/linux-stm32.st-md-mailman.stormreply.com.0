Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBeuA4Dd/GlFUwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 20:44:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A33004ED91E
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 20:44:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A462C8F289;
	Thu,  7 May 2026 18:44:15 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97186C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 18:44:14 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-51306c9f2a8so11012581cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 11:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778179453; x=1778784253;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OHugVXwVYl4EIQGFzGx4AQVN+wMQGiAhztZolIIb7Q=;
 b=mcYKSeCwU8ELx8iGoM+vDMdUGn3Sk4rF/DD9lqHA/grFdutwotiQirUdOMhtJBYFdF
 SAXn1EMJR0f9Ij28pn5FxCLvjNTqhk0cbHHSC3k1lb/0asRWvxmDXR30z8vSF9niH6+V
 zTOFXmxV2VPS1ARTUcujCNNjvyU/lcF7I4FXrAW0I75kCRAvul/YeArUlELWWb29eG7L
 wYjJR25NB0rJu4AbNYKRt7ojEt5c+l45Ruphne2TCLc3Oe7eqHzHjutHhYgASw/Txwcu
 igVyLUUUL7m9MrBxPwAlhK8RLgaQ48qDlmAx+tpxutvjyxleLouTCdSnIHzOuOsmmbbe
 gx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778179453; x=1778784253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1OHugVXwVYl4EIQGFzGx4AQVN+wMQGiAhztZolIIb7Q=;
 b=m+uhsykG7WinJy1UiDeXATrvOKQcBvM4ojgXYPCfk3V0Pmum0TacAEBJENaeBjE7l/
 GmXmIW9hmWJ8CQrZWzYrHhnLifRoDEeHWo3tDH8LxBaWvsMK6b+oW/YLJslkSRPt3G6v
 rdvk5H7hLgasVNoreavhiPkux51KTqmLs+VVMHGx11nN8pCx7XRzchkyzXyrBCqhEojN
 9ZQlkyR/7drCw2Y7ax53jwtdCxJrGaSv+i+Pd0ldZ68AJdbTt5hyOS5pRKkeq81ZQK2e
 ONbs7LenAqyUiFS1Ml0XxVLyFGuC1PPpQjHZHb3gFem3rYVnQhVSMgCkxlzeZ0CzGAJ/
 D7CQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ99c3FtJ1wym9ygIZClJICIvM8JZERlNrm4u3lO7xxZFyrrl1YYtKiiW0Ii1BTAg3XYqQ6lsQHklHwu+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxDu8gh1+ppB14UnVZb9ybMejyXROq6xsxWUkVyz7tfIc93bQUO
 dfwOr5FAm4fy83SQN1reoAdtm6JIgryF1jntIW8e9OBueb9iUFT7eMHKb9VregxZlYs=
X-Gm-Gg: AeBDievuA33qd1+S4IxQdR4CCXb35KxCp+aoUplAlWPH7h07HNTb4q3gBVy2soIok+R
 C04F1hpL/ep/45zdGLScB7UC9mqNKY+om5R0usdDqQ4/yIoaC9ryNsnSifHN35rv5lpO4WkA8/8
 zI2wNlQdJsjkQiu/5uTEvanXYFbNUfKVP6+v+WA9Hr4lQmoMwGV61SzIDnCZ9rohmfRflz9z1lm
 bYmn0y/shjNDZZO8nu3dmC03aTnv+yHzHDUiROjdn6/dJ/5OQdNxdPs5qfsf2Em5bj/MyfZbQpx
 7GfhMiFatXgHfhu0K9BlWSJgmRYMits+Y5kUr3Kagm2CCa+cLH9573v7Fx/Cv2ErZG8o9H7IE65
 m9B8dXpkImZEIW8CVTTUrMzxYSivif1SwZ45Zn0DPjoClo557p3GRow0HdzFHUswWF8hMkKlOPZ
 H25FO/GBs3T8oeUnvu81i7E5BthylujM3jkPNQMcgPRmd12EoGf28nUgNoZ52jw/yLh46kYKI73
 W4=
X-Received: by 2002:a05:622a:8c7:b0:50e:5fe2:83a9 with SMTP id
 d75a77b69052e-51461bf0515mr133144421cf.5.1778179453134; 
 Thu, 07 May 2026 11:44:13 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-514850d0d82sm5022531cf.5.2026.05.07.11.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 11:44:12 -0700 (PDT)
Message-ID: <ae90a4c9-f027-4373-a378-d0d4b7796ff3@riscstar.com>
Date: Thu, 7 May 2026 13:44:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xilin Wu <sophon@radxa.com>, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: A33004ED91E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:maxime.chevallier@bootlin.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:linu
 x-arm-kernel@lists.infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: no action

T24gNS82LzI2IDc6NTkgQU0sIFhpbGluIFd1IHdyb3RlOgo+IE9uIDUvMS8yMDI2IDExOjU0IFBN
LCBBbGV4IEVsZGVyIHdyb3RlOgo+PiArwqDCoMKgIC8qIEFYSSBDb25maWd1cmF0aW9uICovCj4+
ICvCoMKgwqAgYXhpID0gJnRkLT5heGk7Cj4+ICvCoMKgwqAgYXhpLT5heGlfbHBpX2VuID0gMTsK
Pj4gK8KgwqDCoCBheGktPmF4aV93cl9vc3JfbG10ID0gMzE7Cj4+ICvCoMKgwqAgYXhpLT5heGlf
cmRfb3NyX2xtdCA9IDMxOwo+PiArwqDCoMKgIC8qIEFsbCBzaXplcyAoMl4yLi4yXjgpIGFyZSBz
dXBwb3J0ZWQgKi8KPj4gK8KgwqDCoCBheGktPmF4aV9ibGVuX3JlZ3ZhbCA9IERNQV9BWElfQkxF
Tl9NQVNLOwo+PiArwqDCoMKgIHBsYXQtPmF4aSA9IGF4aTsKPj4gKwo+PiArwqDCoMKgIHBsYXQt
Pm1hY19wb3J0X3NlbF9zcGVlZCA9IHNwZWVkOwo+PiArwqDCoMKgIHBsYXQtPmZsYWdzID0gU1RN
TUFDX0ZMQUdfTVVMVElfTVNJX0VOIHwgU1RNTUFDX0ZMQUdfVFNPX0VOOwo+IAo+IEkgZ290IFdv
TCB3b3JraW5nIG9ubHkgYWZ0ZXIgYWRkaW5nIFNUTU1BQ19GTEFHX1VTRV9QSFlfV09MIGhlcmUu
IEkgCj4gZ3Vlc3MgaXQncyByZXF1aXJlZCwgc2luY2UgdGhlIGRyaXZlciBjbG9ja3MgZG93biB0
aGUgTUFDL1BNQS9YUENTIGluIAo+IGl0cyBzdXNwZW5kIGhvb2s/CgpJIGp1c3Qgd2FudCB0byBy
ZXNwb25kIHRvIHRoaXMgd2l0aCBhIHN1bW1hcnkgb2Ygb3VyIHBsYW5zLgoKV2Ugd2lsbCAqbm90
KiBiZSBpbXBsZW1lbnRpbmcgd2FrZS1vbi1MQU4gKFdvTCkgaW5pdGlhbGx5LiAgV2UKd2lsbCB3
b3JrIHRvIGdldCBzdXBwb3J0IGZvciB0aGUgZU1BQ3MgdXBzdHJlYW0gZm9yIFRDOTU2eCwgYW5k
CnRoZW4gYXMgYSBzZXBhcmF0ZSBzdGVwLCB3ZSB3aWxsIGVuYWJsZSBXb0wuCgpJdCdzIGdyZWF0
IHRvIGtub3cgeW91IGhhdmUgaXQgd29ya2luZywgYW5kIG91ciBwbGFuIGlzIHRvCmltcGxlbWVu
dCBpdCB2aWEgdGhlIFBIWXMgYW5kIG5vdCBpbnZvbHZlIHRoZSBNQUMuICBJdCBzZWVtcwppdCB3
aWxsIGJlIHJlbGF0aXZlbHkgZWFzeSwgYnV0IHdlIGhhdmUgbm8gcGxhbnMgdG8gYWRkIGl0IHRv
CnRoZSBjdXJyZW50IHNlcmllcy4KCgkJCQkJLUFsZXgKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
