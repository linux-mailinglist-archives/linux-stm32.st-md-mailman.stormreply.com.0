Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAJMA7h5j2mWRAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 20:21:28 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942FA13924A
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Feb 2026 20:21:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2658BC8F265;
	Fri, 13 Feb 2026 19:21:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5DA7C87EDC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Feb 2026 19:21:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61DF82ot2628434
 for <linux-stm32@st-md-mailman.stormreply.com>; Fri, 13 Feb 2026 19:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=; b=n6Jpo9CHKdqjFPx7
 v5EaF8vVhX2l082qisnceDw76JfYyuBwc6L9g1w4yVqlFMNWW+77QDBsi0b7372K
 +S9LsOh9lh4EhGHWcLlUSXL1ZlmBcX1kbd5uNJqC7Kg/Fmi496jZEkJXjGsOWufh
 juv38KO6kgtRk1KTohNdRF3wQuzpnB0cBkPNi5UkDvfn0LhkabUfLFxuKPnAjLnZ
 gZJh0ap9UNNJfjyQNpivsLTgmzY4vpQ2AV6HOKKWDSlVPMu3vAERkLjC0Re8Qfw4
 YbH1nE+Owm7rr8tFYkNi51LG1delweknJC1MCdM+lOQcbsLTK8S5f07uEuBiu26b
 UfGh4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygutk5n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Feb 2026 19:21:23 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8244932b122so2888540b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Feb 2026 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771010482; x=1771615282;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
 b=M9PbynHiUEZBz1Ja7HZqOOtzTFD1BDDc1+KGihYlDldSwfpQwSHTwWi00TQZatGDCS
 2+z7sElnSS+6gBI0aHfZ5jWKO3tPZ/eGRSCXKyBGPj6D5tPO7vxMN1ge4PNwi4GglIpG
 4p13MzH7JHhmwmpS3p0oKUZZKzpXSvjqg9ZpVhhZXEv8XNSl2hLQfYCOFs/yJaQvtIJy
 M6ZVP8wELjQvVOUGKGeZk3kFibw2rfGbPZhBHG8tMQmoYl0f3RjrEHMRMvsNXfSGvUjf
 sEMq8sfACLxBvEiAMfkYU8g9ycBQtly+6urgDEb8aeSyAOFy9PcTPv6R9YKdw3O5qK3A
 pSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771010482; x=1771615282;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/j+c1dsKAqHBdFM+Jul/RdoFeeY+gCzkUvQYQD74pFQ=;
 b=bRLxLuYYwSiBmE7jmn2F7YZcKNhpMuwC4D569w5yhbYu/BefXSp0J82oP2XAouaRD5
 Z7j3gyINdNHljpGGkh31S+d5o+dQhYnEU8UHiAmOERO0JSG32WEgxP2Mn5e3WHAsajzC
 2dnADPDbmaGQJJCxGnXuyAnnzFwi2cinPyZqQ/CtADHZkQqgAnOOE745iWcJHFnZIdFg
 gpacpPooP5/FB3pEwR8SSKUoWWu08PaK4LiHN9f3RL/egyyDvsJ5kozvYztvGOhiOhSz
 4PmMnIZFv4cnVZdil1Gfj3HM7bmHF33ysE2GxqZ70Zf0uxi8qO+3SWCHCrFKy4CM1K7s
 zdcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosleMCXPNOirmkopLvr7GtmsB49obQWN5C5LbUNTnOSi3WcIlZyIXOhbjKY7BQPiXLuxDzOSmBMPE3A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyEQmBiIwBAD47lX2BAlDuDi8BD3N3nvZI1E1BbHpfuKpoC/tWi
 TcYNHWQTZ7iOlmGXgEDzxtop8y6QXcaROC8o9DAw+WH/leMx7XyPMl1fcxSIuWb+VUqzm4RRJUI
 irvblkf1LYh6cKCPJE+DAn+HLN10bzNtESyF5lbR9gYjkm8S+HFHVYxD+pHprccgKosldJaBSrF
 l5RX60HhQ=
X-Gm-Gg: AZuq6aIRVVv/LKVgqTheWXaBlX+fFO5Njf38EZObq2kgPjkPnZmKkhrqZm/8cN/RtI+
 WaN+1NIa+HWTJLc4gVZqJgqBX/uEZHOUCgptQiEwSpOxg3hNKuXxppDGG0Iae6PPuIBd9wO6yML
 C3/HLE2xIM3mNS36MNKc0+y+RpCqUDUo4nF1vBYndBpVJcG65dstDUOCgsfaws8E2dlbQF/S1ZQ
 CB3UHmqssT2kmmct33Q3yJFCTzcTDE8Wu9lIimCtIF7AAcud78zDOdl3zALS7g0NPF0cjI0Vii9
 Gf5gzCFNA+g4S8BYhDGX624+F8pM1ntRbTRkCobSFUQeznOuiG64RMkvEmzpaTTicGEV/rl8Kmb
 6c4tTZMNgCmRuflid5FsTI3Ms+KBSwOqE9w0=
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id
 d2e1a72fcca58-824c9310c16mr2776895b3a.0.1771010482235; 
 Fri, 13 Feb 2026 11:21:22 -0800 (PST)
X-Received: by 2002:a05:6a00:3996:b0:81f:4675:c2a9 with SMTP id
 d2e1a72fcca58-824c9310c16mr2776865b3a.0.1771010481623; 
 Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824c6bb55adsm3238949b3a.62.2026.02.13.11.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:21:21 -0800 (PST)
Date: Sat, 14 Feb 2026 00:51:13 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
X-Proofpoint-GUID: jeJil2gWIGFGj3PVUxzKFtNjiRxJOG46
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDE0OSBTYWx0ZWRfX3l2Ef7kZJ7m4
 89c1c07s7pW2JLIQ+3K+3rh7fKDPH61qBBxnMqBqHpg1FjuX5JAbd9i4aYCgE/CSSJ9sb89w5Oc
 grvxPNsmQ1bcWv5Dqkkxd7Lzqr/GPQCXXjuMm3PJInEs3eZgzv5BZC07ktkiS39dWq96DDlri7i
 MJkD49pQsdevN4Khb3fhBvHo+f4+JlOQm1fOjAswRv2B0OBuf7f2BYBL77r1gwngPWWntzqng9y
 6g+if8767MggAn2+NSX2yFyZ0EC/yiadrBk8kfKE3LRl8vnTTuJSdZP0eAAzK/pAUn6Ubs3imy4
 zSBcuMs7SiN5VSTjSJZiY9duWvcqYuuhVW4xgycqPaPqqH+ycfCQFfXhyZCacrn5eJWhBUPVcKz
 +ax0MHwHXUkMoZNXFKVSe1KcHrkGt9aScAOWEWBdp68gAbsOYYP8mp2S9GdAno11z8Lbqthem87
 K6zK4PDzFqiZC1MMZzQ==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f79b3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=D3qBBfOVRyNl_mCGRPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: jeJil2gWIGFGj3PVUxzKFtNjiRxJOG46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_04,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130149
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac:
 qcom-ethqos: cleanups and re-organise SerDes handling
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 942FA13924A
X-Rspamd-Action: no action

SGVsbG8gUnVzc2VsbCwKCk9uIFRodSwgRmViIDEyLCAyMDI2IGF0IDEyOjA5OjEwQU0gKzAwMDAs
IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiBIaSwKPiAKPiBBcyB0aGUgbGFzdCBzZXJp
ZXMgaGFkIGlzc3VlcyB3aXRoIHN0YWJpbGl0eSwgSSd2ZSBjaGFuZ2VkIHRoZSBhcHByb2FjaAo+
IGluIHRoaXMgc2VyaWVzIHRvIGNvbmNlbnRyYXRlIG9uIGtlZXBpbmcgbXVjaCBvZiB0aGUgU2Vy
RGVzIHJlbGF0ZWQKPiBjb2RlIHdpdGhpbiB0aGUgcWNvbS1ldGhxb3MgZHJpdmVyIHJhdGhlciB0
aGFuIHRyeWluZyB0byBtb3ZlIGl0IG91dCBhdAo+IHRoaXMgc3RhZ2UuIFRoaXMgbWVhbnMgaXQg
c2hvdWxkIGJlIHBvc3NpYmxlIHRvIGJpc2VjdCB0aGVzZSBwYXRjaGVzIGFuZAo+IHBpbnBvaW50
IGV4YWN0bHkgdGhlIGNvZGUgbW92ZW1lbnQgdGhhdCBjYXVzZXMgYW55IGluc3RhYmlsaXR5Lgo+
IAo+IFRoaXMgc2VyaWVzIHN0YXJ0cyB3aXRoIHZhcmlvdXMgY2xlYW51cHMgdG8gcWNvbS1ldGhx
b3MgKHRoZSBmaXJzdCBmb3VyCj4gcGF0Y2hlcykgYmVmb3JlIGJlZ2lubmluZyB0byBtb3ZlIGNv
ZGUsIHBhc3NpbmcgcGh5bGluaydzIHBoeSBpbnRlcmZhY2UKPiAod2hpY2ggd2lsbCBjaGFuZ2Up
IHRvIHRoZSBmaXhfbWFjX3NwZWVkKCkgbWV0aG9kLCBhbmQgdGhlbiB1c2luZyB0aGF0Cj4gdG8g
Y29uZmlndXJlIHRoZSBzZXJkZXMgYW5kIGluYmFuZCBzZXR0aW5nIGJlZm9yZSBtb3ZpbmcgdGhl
IFNlckRlcwo+IGNvZGUuCj4gCj4gUGxlYXNlIHRlc3QgdGhpcyBwYXRjaCBzZXQsIGFuZCBsZXQg
bWUga25vdyB3aGV0aGVyIHRoaXMgd29ya3MsIG9yCj4gd2hlcmUgaXQgYnJlYWtzLgo+IAo+IFRo
YW5rcy4KPiAKPiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWR3Yy1xb3MtZXRo
LmMgICAgfCAgIDMgKy0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdt
YWMtaW14LmMgICAgfCAgMTEgKy0KPiAgLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9k
d21hYy1sb29uZ3Nvbi5jICAgfCAgIDMgKy0KPiAgLi4uL2V0aGVybmV0L3N0bWljcm8vc3RtbWFj
L2R3bWFjLXFjb20tZXRocW9zLmMgICAgfCAxMTQgKysrKysrKysrKysrLS0tLS0tLS0tCj4gIC4u
Li9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jICAgIHwgICAzICst
Cj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXN0aS5jICAgIHwg
IDExICstCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgIHwgICAzICstCj4gIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAzICstCj4gIDggZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwg
NjEgZGVsZXRpb25zKC0pCj4gCgpUaGluZ3MgbG9vayBwcmV0dHkgc3RhYmxlIG9uIHRoZSBRQ1M5
MTAwIFJpZGUgUjMgYm9hcmQgKHdpdGggdGhlIEFRUjExNUMKUEhZKS4gSSB3b3VsZCBsaWtlIHRv
IHRlc3QgYSBiaXQgbW9yZSBhbmQgc2hvdWxkIGJlIGhhcHB5IHRvIHByb3ZpZGUgYQpUZXN0ZWQt
Ynkgb25jZSB0aGF0J3MgY29tcGxldGUuCgpJIG1heSBhbHNvIGdldCBhY2Nlc3MgdG8gYSBib2Fy
ZCB3aXRoIGFuIFJHTUlJIFBIWSBvbiBNb25kYXksIHNvIEnigJltCmhvcGluZyB0byB2ZXJpZnkg
dGhlIGNoYW5nZXMgdG8gZXRocW9zX3JnbWlpX21hY3JvX2luaXQgYXMgd2VsbCBhcyB5b3VyCnBh
dGNoIGZyb20gdGhlIHByZXZpb3VzIHNlcmllcyAo4oCcbmV0OiBzdG1tYWM6IHFjb20tZXRocW9z
OiBjb252ZXJ0IHRvCnNldF9jbGtfdHhfcmF0ZSgpIG1ldGhvZOKAnSkgc29vbi4KCglBeWFhbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
