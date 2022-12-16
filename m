Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E37B064EAE0
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Dec 2022 12:50:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 893BBC65E46;
	Fri, 16 Dec 2022 11:50:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9AFEC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 11:50:07 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1601472wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Dec 2022 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5f2szHXaGzFXM+QokmgsfkmBLkNqXSfiDGTjKRlczWs=;
 b=qNZ/FYhREmmt5LtYE0eoBDKw5tiLcmpSabQQ8BzMy35Npi5VQMIekUewPLAqdd/iyj
 8Yq7IbCiXb7szX5M/6hlnfGr9rMOGm4DdPuSy1DW3qp9QY216qFd8f944J6cv3ljEt/o
 KgnlPEjTDQIShYwigGHS/TGqgC2pvUQNKx53o/Q2Gz+D1yawFjyCZpKtAsZYvpgzlJjg
 lmFfkStNvmdsUZVGvOcArGBvfdMOl+IH9pMzTFk+kanuc2qPun0SOSosEqCUN572wmvi
 XFZTU4WBsW/OwBdcNAr6z+cKpCVhKoCiQ/LI40OnAtSg7jZKTZIZo5yz8HYjMJXgB8TN
 sUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5f2szHXaGzFXM+QokmgsfkmBLkNqXSfiDGTjKRlczWs=;
 b=N/O8v5Dak6vZR60+m3B+49EIMYBFnUGHQnis1fT/YD/cdrTnAOWV8dvePk/Uk3qiMq
 8RA+wVqhtIjUwqc4U6b9fN4nqX6ELX1qLDvIMj70BfiwC8XKZuU3NpVGK+1SiRdMRYCh
 /ivrndkQgDUB8ESDFnDkhP+kjoypspX1K4ICjY1SnF6H7DG5u+DDuY2IIlDj7zuQYDsI
 D5gx+L2hGC5oyZROjotralu+R5aSOfeyjduYHUlB+c3bX0dqZoKo8JthS6B7GcBjIGuu
 HdVbi85fLz+xCVVBSMFv/GyAfRNkozyz6KnyhK02LP1RTgHFt1NcySu/3iIgTXDrIxdM
 /zdw==
X-Gm-Message-State: ANoB5pn4AWRzowAVfKuYcjUQL51T8HoX8lbNzqQXCg17MPVLqLQXi6BA
 IiHb57lXO4vOFhHuZDXkF2w=
X-Google-Smtp-Source: AA0mqf51vop4o/eMa8yjEyPDs/nsh8zNaWybH6NyGggUTd/tMDmyk1W78wI73sdCdOZ6ajioW9R8BQ==
X-Received: by 2002:a05:600c:3508:b0:3cf:b73f:bf8f with SMTP id
 h8-20020a05600c350800b003cfb73fbf8fmr25612865wmq.7.1671191407196; 
 Fri, 16 Dec 2022 03:50:07 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c468c00b003cf483ee8e0sm11375737wmo.24.2022.12.16.03.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 03:50:06 -0800 (PST)
Message-ID: <bc718a1e-13e9-db16-efef-06e94395ba39@gmail.com>
Date: Fri, 16 Dec 2022 12:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-6-bero@baylibre.com> <7ho7si56n3.fsf@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <7ho7si56n3.fsf@baylibre.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 5/7] arm64: dts: mediatek: Remove
 pins-are-numbered property
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

CgpPbiAwNS8xMi8yMDIyIDE0OjIwLCBLZXZpbiBIaWxtYW4gd3JvdGU6Cj4gTWF0dGhpYXMsCj4g
Cj4gQmVybmhhcmQgUm9zZW5rcsOkbnplciA8YmVyb0BiYXlsaWJyZS5jb20+IHdyaXRlczoKPiAK
Pj4gUmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBwaW5zLWFyZS1udW1iZXJlZCBwcm9wZXJ0eSBmcm9t
Cj4+IGFybTY0IE1lZGlhdGVrIERldmljZVRyZWVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlcm5o
YXJkIFJvc2Vua3LDpG56ZXIgPGJlcm9AYmF5bGlicmUuY29tPgo+PiBSZXZpZXdlZC1ieTogQW5n
ZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4KPj4gQWNrZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+
Cj4gCj4gTm93IHRoYXQgdGhlIGRyaXZlci9iaW5kaW5nIHBhcnRzIGFyZSBxdWV1ZWQsIEknbSBh
c3N1bWluZyB5b3UnbGwgdGFrZSB0aGlzIHBhdGNoCj4gKGFuZCBwYXRjaCA2KSB2aWEgdGhlIG1l
ZGlhdGVrIHRyZWU/Cj4gCgpZZXMsIGJvdGggYXBwbGllZCBub3cuIFRoYW5rcyBmb3IgdGhlIGhl
YWRzIHVwLgoKPiBUaGFua3MsCj4gCj4gS2V2aW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
