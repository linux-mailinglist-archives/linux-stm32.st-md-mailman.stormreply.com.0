Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FED781061
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 18:30:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E71E3C6B461;
	Fri, 18 Aug 2023 16:30:20 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80896C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 16:30:18 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2b9b5ee9c5aso17065421fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692376218; x=1692981018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eheCIS04D13KaOD9ehF57VdxTh/Aid9micuha4mFfwI=;
 b=bm1OIoZF+N/0pR6uhBIgHqro1wEgHCwG2roK5pR+7dvPY86+5o1oF8rjLSgg3/v3pf
 K3GLdutOTTmZd4FaPgmqs/4n9Ryh5afHlID53jO++DSexu0EslNuobTXBj1bBRHyoKve
 fkao5T/UFNqSh19HRJDYUzBtec189sgfQht37m6dg4EE53v8qeGgdva7ZSjRzwyguUbA
 UUvEil4x4+eTJpPBp1yAEEDUucHylIcpICsHNCl76+Hh+ZsDOwvryUV3scQScnglKzNw
 Z7JG9wRc7UAR1XiPInkdB5JU5SRNSDXqke50RyjZ2Smet/p6rl1cRUH6ie0uVsPuaGF/
 dn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692376218; x=1692981018;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eheCIS04D13KaOD9ehF57VdxTh/Aid9micuha4mFfwI=;
 b=fJp9gLjBWW9vWH60GcSPTbkCOXWwCSlEb7tvbY+1gl06Kh8Bx/iQWaiejsWrwL1LiM
 LxyCJKNavog7zRoL/KbiAlgUnU3eF55g7z0APAH78nfFAtC6Q6SwvefKBNtwfFRWeiI1
 fohbwZPF/aHx36xLBmFjATskJfT+kk2wnum2dHZDy84yZTIwF78AebotiCz2NDyFUBAq
 t5MprGojPTeosRkaxpb4vBOoDzNRriygyrXFQlHIpficYn7Tlh3qr8SKhqlQznJFXdZd
 i6FGDIlXymAbBQj9ncYnsGNjlZUHFSsHbUTz2IeZNRGbZlrJuREKhbV5ZobPdslhExJt
 8Y0A==
X-Gm-Message-State: AOJu0YxDHtt7hWd0RIlwsa2M5ev4U0bQQmx/DBRQVOScX4B/tALJ7YBv
 gFev+QvJOZgXScMSEjGdLZA=
X-Google-Smtp-Source: AGHT+IE3GZW+T8zAUVoDtd05y8Z1fKjILRcAs0GZ+hu92/OvbJyo77ITTd/bg0dRfdqbJsDjJhPL3A==
X-Received: by 2002:a2e:3012:0:b0:2b9:44c5:ac15 with SMTP id
 w18-20020a2e3012000000b002b944c5ac15mr2353531ljw.41.1692376217611; 
 Fri, 18 Aug 2023 09:30:17 -0700 (PDT)
Received: from mobilestation ([93.157.254.210])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a2e9b0d000000b002b836d8c839sm518099lji.40.2023.08.18.09.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 09:30:17 -0700 (PDT)
Date: Fri, 18 Aug 2023 19:30:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <xuy7jenzuseth4rwbvqbpb4db3r6ynzagpcrt37kcme7r4izqq@wltdeqwmybpw>
References: <20230817165749.672-1-jszhang@kernel.org>
 <20230817165749.672-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817165749.672-4-jszhang@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/9] net: stmmac: enlarge max
 rx/tx queues and channels to 16
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

T24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgMTI6NTc6NDNBTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3
cm90ZToKPiB4Z21hYyBzdXBwb3J0cyB1cCB0byAxNiByeC90eCBxdWV1ZXMgYW5kIHVwIHRvIDE2
IGNoYW5uZWxzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2Vy
bmVsLm9yZz4KPiBBY2tlZC1ieTogQWxleGFuZHJlIFRPUkdVRSA8YWxleGFuZHJlLnRvcmd1ZUBm
b3NzLnN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHd4Z21hYzJfY29yZS5jIHwgNSArKy0tLQo+ICBpbmNsdWRlL2xpbnV4L3N0bW1hYy5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHd4Z21hYzJfY29yZS5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHd4Z21hYzJfY29yZS5jCj4gaW5kZXggMzg3ODI2NjJm
Zjk4Li44YWM5OTQ1NTNiYzEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3Rt
aWNyby9zdG1tYWMvZHd4Z21hYzJfY29yZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHd4Z21hYzJfY29yZS5jCj4gQEAgLTIzMiw5ICsyMzIsOCBAQCBzdGF0
aWMgdm9pZCBkd3hnbWFjMl9tYXBfbXRsX3RvX2RtYShzdHJ1Y3QgbWFjX2RldmljZV9pbmZvICpo
dywgdTMyIHF1ZXVlLAo+ICAJdm9pZCBfX2lvbWVtICppb2FkZHIgPSBody0+cGNzcjsKPiAgCXUz
MiB2YWx1ZSwgcmVnOwo+ICAKPiAtCXJlZyA9IChxdWV1ZSA8IDQpID8gWEdNQUNfTVRMX1JYUV9E
TUFfTUFQMCA6IFhHTUFDX01UTF9SWFFfRE1BX01BUDE7Cj4gLQlpZiAocXVldWUgPj0gNCkKPiAt
CQlxdWV1ZSAtPSA0Owo+ICsJcmVnID0gWEdNQUNfTVRMX1JYUV9ETUFfTUFQMCArIChxdWV1ZSAm
IH4weDMpOwo+ICsJcXVldWUgJj0gMHgzOwo+ICAKPiAgCXZhbHVlID0gcmVhZGwoaW9hZGRyICsg
cmVnKTsKPiAgCXZhbHVlICY9IH5YR01BQ19ReE1ETUFDSChxdWV1ZSk7Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc3RtbWFjLmggYi9pbmNsdWRlL2xpbnV4L3N0bW1hYy5oCj4gaW5kZXgg
Nzg0Mjc3ZDY2NmViLi45YzkwZTJlMjk1ZDQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9z
dG1tYWMuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvc3RtbWFjLmgKPiBAQCAtMTUsOSArMTUsOSBA
QAo+ICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51
eC9waHkuaD4KPiAgCj4gLSNkZWZpbmUgTVRMX01BWF9SWF9RVUVVRVMJOAo+IC0jZGVmaW5lIE1U
TF9NQVhfVFhfUVVFVUVTCTgKPiAtI2RlZmluZSBTVE1NQUNfQ0hfTUFYCQk4Cgo+ICsjZGVmaW5l
IE1UTF9NQVhfUlhfUVVFVUVTCTE2CgpJbiBEVyBYR01BQyAyLjExYSAoRGF0YWJvb2sgZnJvbSA5
LjIwMTUpIG51bWJlciBvZiBNVEwgUnggcXVldWVzIGlzCmxpbWl0ZWQgd2l0aCAxMjoKTnVtYmVy
IG9mIFJlY2VpdmUgUXVldWVzCURlc2NyaXB0aW9uOiBTcGVjaWZpZXMgdGhlIG51bWJlciBvZiBy
ZWNlaXZlIHF1ZXVlcy4KCQkJCVZhbHVlIFJhbmdlOiAx4oCTMTIKCQkJCURlZmF1bHQgVmFsdWU6
IDEKCQkJCURlcGVuZGVuY2llczogVGhpcyBvcHRpb24gaXMgbm90IGF2YWlsYWJsZSBpbiBYR01B
Qy1DT1JFIGNvbmZpZ3VyYXRpb25zLgoJCQkJSERMIFBhcmFtZXRlciBOYW1lOiBEV0NYR19OVU1f
UlhRCgpBcmUgeW91IHN1cmUgaXQncyBkaWZmZXJlbnQgaW4geW91ciBjYXNlPyBEbyB5b3UgaGF2
ZSBhIFN5bm9wc3lzIEhXCm1hbnVhbCB3aXRoIHRoZSBEV0NYR19OVU1fUlhRIHBhcmFtZXRlciBy
YW5nZSBsaW1pdGVkIHRvIDE2PyBXaGF0CklQLWNvcmUgdmVyc2lvbiBpcyBpdCBhYm91dD8KCi1T
ZXJnZSh5KQoKPiArI2RlZmluZSBNVExfTUFYX1RYX1FVRVVFUwkxNgo+ICsjZGVmaW5lIFNUTU1B
Q19DSF9NQVgJCTE2Cj4gIAo+ICAjZGVmaW5lIFNUTU1BQ19SWF9DT0VfTk9ORQkwCj4gICNkZWZp
bmUgU1RNTUFDX1JYX0NPRV9UWVBFMQkxCj4gLS0gCj4gMi40MC4xCj4gCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
