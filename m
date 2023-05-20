Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82270B4DD
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1624C6B45E;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2575BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 May 2023 01:55:33 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-1ae3a5dfa42so28533755ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 18:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684547731; x=1687139731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RQLH3Pz0r24f41zJi+Y/rFTpLpmNVDUqO6m0VkTNqZQ=;
 b=HZqfno5CxT3eIpLYVJk6Qs92HXMRmJcpQID4d5EqWTu1iPBXDj3lbDSaKtxe9UGK6m
 kfk9DL+ze63ayibZZzbRk31D01m1wdzIil2GaAjwwAdZ18QC7guJjNxyE5tSzu/SO8in
 cDDH0zZuxmTHarIOUI7yBNysayZ6OFgXM49cQYAbeKfLv9EcidMjfEe4cs5ffqhPRfF3
 kvMwIfG/V7OAlU2n6LnRjN6beJaESUaVlB9Af+vzJrX/Y1UZxap4M6fgTJwpUYiR6Wju
 nDK5S3aLnUD9X+b5mBm3tPPT3eB1Cqpdj632VE6DaOfe3vG1IN7aEWkAXsJHABk1lVwX
 D7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684547731; x=1687139731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQLH3Pz0r24f41zJi+Y/rFTpLpmNVDUqO6m0VkTNqZQ=;
 b=PEItnDJK28RB1Wnuja5GL71eoqmBkMdEEzQueL8MvAoqg4RmUWnMyYT1lFB2ArnGZz
 s2zDDi+GGAvuhmKLemW+OkQYP/h8HIsKyAefSbixoKZxG0Z3XEJeVp1cEaSnZ0GVdfyP
 lna5NzqRX6FwBNmMIeyl9bI4Dt+gffS3uA2xG2DXLEG8yisc4DyVee68pFXT3ZeE5/4J
 jL+2XFx6hboK0ipz2+prv2R1yNyiSL33M7UHCxMC+cQ0ZWNtMx6ixQ4z1kEXep98Rqj8
 YO16AM5DI/spVzZpwdyzoJr6HFGWDuwGVPd0kcgNA8HChyY32aIkhVTY8Q3nMfnTQAIf
 FSJA==
X-Gm-Message-State: AC+VfDwFV5C1gGfN0i1jcSZnwQLvz09Hso1APjNSSpQ8B7HVHdP8kC7z
 YvzGbAh5CqC+OKCE+xkDqEE=
X-Google-Smtp-Source: ACHHUZ530gkeNgmhcoWvoQri+XxvWEXyMVxLz2RbkbfZlLY+IC2AiFL1CI4Q6p16HMrqEiBOK6orSA==
X-Received: by 2002:a17:903:248:b0:1a9:3b64:3747 with SMTP id
 j8-20020a170903024800b001a93b643747mr5197035plh.17.1684547731671; 
 Fri, 19 May 2023 18:55:31 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 c9-20020a170903234900b001ac5896e96esm262638plh.207.2023.05.19.18.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 18:55:31 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: kuba@kernel.org
Date: Sat, 20 May 2023 09:55:27 +0800
Message-Id: <20230520015527.215952-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519152715.7d1c3a49@kernel.org>
References: <20230519152715.7d1c3a49@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 minhuadotchen@gmail.com
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and
	p->des1 with __le32 type values
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

SGkgSmFrdWIsCgo+T24gRnJpLCAxOSBNYXkgMjAyMyAxOTo1MDoyOCArMDgwMCBNaW4tSHVhIENo
ZW4gd3JvdGU6Cj4+IC0JCWlmICgocC0+ZGVzMCA9PSAweGZmZmZmZmZmKSAmJiAocC0+ZGVzMSA9
PSAweGZmZmZmZmZmKSkKPj4gKwkJaWYgKHAtPmRlczAgPT0gY3B1X3RvX2xlMzIoMHhmZmZmZmZm
ZikgJiYKPj4gKwkJICAgIHAtPmRlczEgPT0gY3B1X3RvX2xlMzIoMHhmZmZmZmZmZikpCj4KPkNh
biB5b3UgdHJ5IHRvIGZpeCB0aGUgc3BhcnNlIHRvb2wgaW5zdGVhZD8gSSBiZWxpZXZlIGl0IGFs
cmVhZHkKPmlnbm9yZXMgc3VjaCBlcnJvcnMgZm9yIHRoZSBjb25zdGFudCBvZiAwLCBtYXliZSBp
dCBjYW4gYmUgdGF1Z2h0IAo+dG8gaWdub3JlIGFsbCAiaXNvbW9ycGhpYyIgdmFsdWVzPwo+CgpJ
IGRvd25sb2FkZWQgdGhlIHNvdXJjZSBjb2RlIG9mIHNwYXJzZSBhbmQgSSdtIGFmcmFpZCB0aGF0
IEkgY2Fubm90IG1ha2UKMHhGRkZGRkZGRiBpZ25vcmVkIGVhc2lseS4gSSd2ZSB0cmllZCB+MCBp
bnN0ZWFkIG9mIDB4RkZGRkZGLApidXQgaXQgZGlkIG5vdCB3b3JrIHdpdGggY3VycmVudCBzcGFy
c2UuCgowIGlzIGEgc3BlY2lhbCBjYXNlIG1lbnRpb25lZCBpbiBbMV0uCgoiIiIKT25lIHNtYWxs
IG5vdGU6IHRoZSBjb25zdGFudCBpbnRlZ2VyIOKAnDDigJ0gaXMgc3BlY2lhbC4gCllvdSBjYW4g
dXNlIGEgY29uc3RhbnQgemVybyBhcyBhIGJpdHdpc2UgaW50ZWdlciB0eXBlIHdpdGhvdXQKc3Bh
cnNlIGV2ZXIgY29tcGxhaW5pbmcuIFRoaXMgaXMgYmVjYXVzZSDigJxiaXR3aXNl4oCdIChhcyB0
aGUgbmFtZQppbXBsaWVzKSB3YXMgZGVzaWduZWQgZm9yIG1ha2luZyBzdXJlIHRoYXQgYml0d2lz
ZSB0eXBlcyBkb27igJl0CmdldCBtaXhlZCB1cCAobGl0dGxlLWVuZGlhbiB2cyBiaWctZW5kaWFu
IHZzIGNwdS1lbmRpYW4gdnMgd2hhdGV2ZXIpLAphbmQgdGhlcmUgdGhlIGNvbnN0YW50IOKAnDDi
gJ0gcmVhbGx5IF9pc18gc3BlY2lhbC4KIiIiCgpGb3IgMHhGRkZGRkZGRiwgaXQgbWF5IGxvb2sg
bGlrZSBhIGZhbHNlIGFsYXJtLCBidXQgd2UgY2FuIHNpbGVuY2UgdGhlCnNwYXJzZSB3YXJuaW5n
IGJ5IHRha2luZyBhIGZpeCBsaWtlIG1pbmUgYW5kIHBlb3BsZSBjYW4ga2VlcCB3b3JraW5nIG9u
Cm90aGVyIHNwYXJzZSB3YXJuaW5ncyBlYXNpZXIuCihUaGVyZSBhcmUgYXJvdW5kIDcwMDAgc3Bh
cnNlIHdhcm5pbmcgaW4gQVJDSD1hcm02NCBkZWZjb25maWcgYnVpbGQgYW5kCnNvbWV0aW1lcyBp
dCBpcyBoYXJkIHRvIHJlbWVtYmVyIGFsbCB0aGUgZmFsc2UgYWxhcm0gY2FzZXMpCgpDb3VsZCB5
b3UgY29uc2lkZXIgdGFraW5nIHRoaXMgcGF0Y2gsIHBsZWFzZT8KCj4KPkJ5ICJpc29tb3JwaGlj
IiBJIG1lYW4gdGhhdCAweGZmZmZmZmZmID09IGNwdV90b19sZTMyKDB4ZmZmZmZmZmYpCj5zbyB0
aGVyZSdzIG5vIHBvaW50IGNvbXBsYWluaW5nLgoKdGhhbmtzLApNaW4tSHVhCgpbMV0gaHR0cHM6
Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4xMi9kZXYtdG9vbHMvc3BhcnNlLmh0bWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
