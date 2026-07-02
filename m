Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sNOzFkDFRWqYEwsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 03:56:16 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B20936F2E3B
	for <lists+linux-stm32@lfdr.de>; Thu, 02 Jul 2026 03:56:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=qualcomm.com header.s=qcppdkim1 header.b=U8S8x3i+;
	dkim=fail ("body hash did not verify") header.d=oss.qualcomm.com header.s=google header.b=VkrsP+qk;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=qualcomm.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6836BC7129F;
	Thu,  2 Jul 2026 01:56:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B6BFC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2026 01:56:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6621KWMs2917554
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 2 Jul 2026 01:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=; b=U8S8x3i+7rLUqeZ2
 fcYGN7jlpBH43ZIl62Oabjx2cKNzdogm2KVS1A/ejwPaYqnyG77UTQ4b5jY4gUlz
 kU8bfzFOO69nQbo4KZz/V+s9nk66ev+4ShSwP1zGx84gtQt1FQrCk3HCLewBIgnM
 VXe40fPPFnIf/zg64zo6gMaeBqqmxOYw2Fz3Ip68zAh1jmdsuZujStqIPYN2gGeq
 gb7RwdSTDp5Odw9hIYknk1Y0ORgKN52ff+O3mHl0r/hRfFILKXMdZvxJ1WJbO7uH
 lHK//YfP95Y4EMEwo1q8KeMDRRn9Q9RHKJKKuGjK6VR3NXcIR3EBOweMjMI1o/si
 BfFydw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0an3y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jul 2026 01:56:12 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-84770f89b99so1995043b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Jul 2026 18:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782957372; x=1783562172;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=;
 b=VkrsP+qkwN5qVZuwI346fA1EgLt5uKEmcA23ACtxOq8W+m6ysO3rtOK0hKJRs4/CPO
 QTRLLUVecjxD94tHd0T3RWJQ2zrv4g/gcaRV9HfnW+gLLkIrMSW1PcdnxBUb4bJsGlsn
 P0wa7+Ap0WYMdLOwpQQclJ5K+dNUAZNzRmYgbAK0tLqULiLEmQWBNyAgyXg7XsJqAT13
 /7J1+rvIAUcyvID+4Dmt06iHDVhHMt8SkCBzmUN5wMGYw2K8dncOzvneqstZow72D5pG
 F7dpy/ulotaX2eGt6NiCmrwSYwd8IuO59VBodUOgvoKo7l7T1SrYTX4Ho3ak/PzPTSwh
 mQYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782957372; x=1783562172;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LTWT9sxhpyXcjkqFehsCH+/HBJQR/dfUs1L9UJNd16c=;
 b=VZCHdHc1Zi6VjuNZsmQ41Vbo00KydiL+CcZL9t3CH384E+Xonq13r2smWeDIZK2XzJ
 mT1u6nxdqUrd3TvAkdEno/kRjTTetru5A8/znkE87d+T6p4A+Ks6k5+meanEhSbj6tTD
 Tb/JRnDio57IlCD/cEenATLtqcDvkGpNdE3dX5bqqCu8HrcgnF+WIjXxL+XYFZUmKKV2
 BnFkI6biRRwQ1aiJbu75vCSVgxAZ3AMcPNujbL+mmwXN1UTBt479xUxkWftXFoUTxtnO
 dPo1fXWdDL1e4wsutQqrTesZXqhSV/19l7G9ai5gD1/ctThfP500EIL189ZbYTgKsAaH
 uomA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrpCIMWSOwsPJp+B8WOsFaVB85io7xEMA//IpjPQUCUtrXc0YWTv7Z1VIGC+SOKlyeWSM9Uoc4McdxlKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwpCv/EuuSUiGKC+ySYRJQdlGd/l2wQOgIEZB6VEzyqn/twBDoB
 E8IIjZIcygRl+AxljDspqar+shSsVJv3KtvcB7VOUfCEE3Fp5xLiMC0Fu/C8u835ellfTt7TlmG
 LcT6M2vftPsSgd2GgsykaINU/d6a4NNalZRc2yPrc52qGg7l0JN62l9oFk+DZOL64i8WyRvD/td
 n8H1gqTqs=
X-Gm-Gg: AfdE7cn13gxuLelUVoie9sTQjtHotiVI+xEiTd7P9AmB0Z4LFo73Qn0eLPLTb812DLU
 zu/Dv8mgaQF6xvVDuqvsarihKhEVTVi0+SHghTJuT82Au0LqxDaUGZU0BriX8rr/CDW1b6pi3/j
 gCXDlMQh6W0cMj2Bp0rjqFEI9LLkSEqIWRREWS4IuXBOKt6glhiO9sP2BlHOgS38buPWO1H3zqH
 izGqsvmLfJH2DyhjpwhJNyaatoJrdgwLfds0wmL15KDoC0nJDiBtTahQpODv/zE9qkaNf7qXuMv
 bAUu31/nCiNMUePCKpqPIslHIJ7ahy8Hb7Tdn9aZ536qchi3GBkgy1i64TGkNnrwVcsEDl/PHOL
 VwN2eGktRyHkqXfQq+8H60sDDYjwCF1nfGcpaS6jdzbLad6QpCfkRxRted9H3yxjW9ox6dif+i3
 8O
X-Received: by 2002:a05:6a00:982:b0:847:9585:73bc with SMTP id
 d2e1a72fcca58-847c0673ea7mr3875189b3a.1.1782957371523; 
 Wed, 01 Jul 2026 18:56:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:982:b0:847:9585:73bc with SMTP id
 d2e1a72fcca58-847c0673ea7mr3875162b3a.1.1782957370821; 
 Wed, 01 Jul 2026 18:56:10 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847cb6dc4d0sm567315b3a.3.2026.07.01.18.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 18:56:10 -0700 (PDT)
Message-ID: <4e41e58e-5fbf-4564-bf9e-cec42570f3d5@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 09:56:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
 <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
 <20260701162321.GG1812158@e132581.arm.com>
 <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5218878b-c91f-4d14-ba12-68edf7b3f4a7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a45c53c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=P5EO7plK2hrSIlTIuPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: xYtls4Ab5XhveMdK1kH4tf25JxvIK7fx
X-Proofpoint-GUID: xYtls4Ab5XhveMdK1kH4tf25JxvIK7fx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAxNyBTYWx0ZWRfX0XlGiNJA+Gvf
 jstfi9RnAA2b2CHRUuDfc4JNt8ysRStECRxgi18BSK7AeFOfij3paKOlMfNuNC0MFrseprHWkBL
 7DLr45gj7r/TDSVzp6kl4AXEouEVH83pWuj9kw+8QwqHOhwZIGl1p+dYb16eu36Wa3ykzc2TqAP
 bnq1oHOLDlHP3w8mS7uRf4S2Itxooc88UBRfWWUtjCJHoLomPfeHxXGiuZE2AgGkV/SYvbESvRr
 0ZORs1yduHTmN3aXpEN8bGuDxY1hQreoERGql/9LB4S3/eegnjWx046Ptb0q1AcN6ChOP/UWwQ+
 /yzzzqs8eQ+8wgsSTe3s0K7ku/H3oejaFvMP+KM4yNgif2/HHgUaM4+IsU5FUxekZWuoiJ1GEri
 JWpU0TT6iN/jLEYfjPitELfkMhlUS8+UKp4Q6DdYYfkNgvYgFMR1lEdeiuyZZC0xosO2Nqi2Pq+
 HpNKemQ9D5vXto04rSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAxNyBTYWx0ZWRfX9JfYBgNVDNYY
 YVK731HjFPNy1TIyRa4F/w5Uo7E4CcoSaAeV1Z+TA8SWWcw/GhkRizOPUZDgbLO3AF6QWrLGn/c
 WRBvAa9QfQ0rZ5+ZgDdw7CY4LKsVT4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020017
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] coresight: Fix clock refcount
 imbalance on platform remove
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
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:leo.yan@arm.com,m:mcoquelin.stm32@gmail.com,m:anshuman.khandual@arm.com,m:alexander.shishkin@linux.intel.com,m:linux-kernel@vger.kernel.org,m:james.clark@linaro.org,m:suzuki.poulose@arm.com,m:linux-stm32@st-md-mailman.stormreply.com,m:yuanfang.zhang@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:mike.leach@arm.com,m:coresight@lists.linaro.org,m:yeoreum.yun@arm.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,arm.com,linux.intel.com,vger.kernel.org,linaro.org,st-md-mailman.stormreply.com,oss.qualcomm.com,lists.linaro.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B20936F2E3B

CkhpIExlbywKCk9uIDcvMi8yMDI2IDg6NTkgQU0sIEppZSBHYW4gd3JvdGU6Cj4gSGkgTGVvLAo+
IAo+IE9uIDcvMi8yMDI2IDEyOjIzIEFNLCBMZW8gWWFuIHdyb3RlOgo+PiBPbiBXZWQsIEp1bCAw
MSwgMjAyNiBhdCAwMjowNTowMlBNICswODAwLCBKaWUgR2FuIHdyb3RlOgo+Pgo+Pj4gQWZ0ZXIg
cHJvYmUsIHBtX3J1bnRpbWVfcHV0KCkgYWxsb3dzIHRoZSBkZXZpY2UgdG8gc3VzcGVuZCBhbmQg
dGhlCj4+PiBydW50aW1lIHN1c3BlbmQgY2FsbGJhY2sgZGlzYWJsZXMgdGhlIHNhbWUgY2xvY2tz
LiBEdXJpbmcgcmVtb3ZlIHRoZQo+Pj4gZGV2aWNlIGlzIGxlZnQgcnVudGltZSBzdXNwZW5kZWQs
IHNvIHBtX3J1bnRpbWVfZGlzYWJsZSgpIGZyZWV6ZXMgaXQKPj4+IHdpdGggdGhlIGNsb2NrcyBh
bHJlYWR5IGRpc2FibGVkLiBUaGUgZGV2bSBjbGVhbnVwIHRoYXQgcnVucyBhZnRlcndhcmRzCj4+
PiBjYWxscyBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBhIHNlY29uZCB0aW1lLCB1bmRlcmZsb3dp
bmcgdGhlIGNsb2NrCj4+PiBlbmFibGUgcmVmY291bnQuCj4+Cj4+IFRoYW5rcyBmb3IgZml4aW5n
IHRoZSBpc3N1ZS4KPj4KPj4gVGhlIHByb2JsZW0gaXMgdGhhdCBpZiB0aGUgZGV2aWNlIGhhcyBh
bHJlYWR5IGJlZW4gcnVudGltZSBzdXNwZW5kZWQgYW5kCj4+IGl0cyBjbG9jayBoYXMgYmVlbiBk
aXNhYmxlZCwgYWZ0ZXJ3YXJkcyB3aGVuIHJlbW92ZSB0aGUgZGV2aWNlLCB0aGUgZGV2bQo+PiBj
bGVhbnVwIGRpc2FibGVzIHRoZSBjbG9jayBhZ2FpbiwgcmVzdWx0aW5nIGluIGNsb2NrIGNvdW50
IHVuZGVyZmxvdy4KPj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2ln
aHQvY29yZXNpZ2h0LWZ1bm5lbC5jIGIvIAo+Pj4gZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1mdW5uZWwuYwo+Pj4gaW5kZXggMGFiYzExZjA2OTBjLi40YzViOTQ2NDBlNmEg
MTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWZ1
bm5lbC5jCj4+PiArKysgYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWZ1
bm5lbC5jCj4+PiBAQCAtMzM0LDYgKzMzNCw3IEBAIHN0YXRpYyB2b2lkIGZ1bm5lbF9wbGF0Zm9y
bV9yZW1vdmUoc3RydWN0IAo+Pj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybjsKPj4+IMKgwqDCoMKgwqAgZnVubmVsX3JlbW92ZSgmcGRldi0+ZGV2
KTsKPj4+ICvCoMKgwqAgcG1fcnVudGltZV9nZXRfc3luYygmcGRldi0+ZGV2KTsKPj4+IMKgwqDC
oMKgwqAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+Pgo+PiBMZXQncyB1c2UgdGhl
IGZ1bm5lbCBkcml2ZXIgZm9yIHRoZSBkaXNjdXNzaW9uLiBPbmNlIHdlIGFncmVlIG9uIHRoZQo+
PiBhcHByb2FjaCwgd2UgY2FuIGFwcGx5IHRoZSBzYW1lIGNoYW5nZSB0byB0aGUgb3RoZXIgQ29y
ZVNpZ2h0IHBsYXRmb3JtCj4+IGRyaXZlcnMuCj4+Cj4+IEhvdyBhYm91dCB0aGUgZm9sbG93aW5n
IHRlYXJkb3duPwo+Pgo+PiDCoCBzdGF0aWMgdm9pZCBmdW5uZWxfcGxhdGZvcm1fcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZnVubmVsX2RydmRhdGEgKmRydmRhdGEgPSBkZXZfZ2V0X2RydmRhdGEoJnBkZXYtPmRl
dik7Cj4+ICvCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4KPj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAo
V0FSTl9PTighZHJ2ZGF0YSkpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybjsKPj4KPj4gK8KgwqDCoMKgwqDCoCByZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKCZwZGV2
LT5kZXYpOwo+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfd2FybigmcGRldi0+ZGV2LCAiZmFpbGVkIHRvIHJlc3VtZSBiZWZv
cmUgcmVtb3ZlOiAKPj4gJWRcbiIsIHJldCk7Cj4+ICsKPj4gwqDCoMKgwqDCoMKgwqDCoCBmdW5u
ZWxfcmVtb3ZlKCZwZGV2LT5kZXYpOwo+PiArCj4+IMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGlt
ZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwo+PiArwqDCoMKgwqDCoMKgIHBtX3J1bnRpbWVfc2V0X3N1
c3BlbmRlZCgmcGRldi0+ZGV2KTsKPj4gK8KgwqDCoMKgwqDCoCBwbV9ydW50aW1lX3B1dF9ub2lk
bGUoJnBkZXYtPmRldik7Cj4+IMKgIH0KPiAKPiBUaGlzIHByb3Bvc2FsIGxvb2tzIGdvb2QgdG8g
bWUuIEkgZm9yZ290IHRvIGFkZCBwbV9ydW50aW1lX3B1dF9ub2lkbGUgdG8gCj4gZHJvcCB0aGUg
dXNlbGVzcyByZWZlcmVuY2Ugd2hpY2ggY3JlYXRlZCBieSBwbV9ydW50aW1lX2dldF9zeW5jLgo+
IAoKSSBkcm9wcGVkIHRoZSBsaW5lIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgZm9yIHNpbXBs
aWZ5aW5nLgpIZXJlIGlzIHRoZSBmaW5hbCB2ZXJzaW9uIGZyb20gbXkgcGFydCwgY2FuIHlvdSBw
bGVhc2UgaGVscCB0byByZXZpZXcgYWdhaW4/CgogIHN0YXRpYyB2b2lkIGZ1bm5lbF9wbGF0Zm9y
bV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICB7CiAgICAgICAgIHN0cnVj
dCBmdW5uZWxfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YSgmcGRldi0+ZGV2KTsK
CiAgICAgICAgIGlmIChXQVJOX09OKCFkcnZkYXRhKSkKICAgICAgICAgICAgICAgICByZXR1cm47
CgotICAgICAgIGZ1bm5lbF9yZW1vdmUoJnBkZXYtPmRldik7CisgICAgICAgLyoKKyAgICAgICAg
KiBSZXN1bWUgdGhlIGRldmljZSBzbyBpdHMgY2xvY2tzIGFyZSBlbmFibGVkIGFnYWluLCBiYWxh
bmNpbmcgdGhlCisgICAgICAgICogY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkgdGhhdCBkZXZtIHJ1
bnMgd2hlbiB0aGUgZHJpdmVyIGRldGFjaGVzLgorICAgICAgICAqIFRoZW4gbWFyayBpdCBzdXNw
ZW5kZWQgYW5kIGRyb3AgdGhlIHVzYWdlIGNvdW50IHRha2VuIGhlcmUuCisgICAgICAgICovCiAg
ICAgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoJnBkZXYtPmRldik7CisgICAgICAgZnVubmVsX3Jl
bW92ZSgmcGRldi0+ZGV2KTsKICAgICAgICAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYp
OworICAgICAgIHBtX3J1bnRpbWVfc2V0X3N1c3BlbmRlZCgmcGRldi0+ZGV2KTsKKyAgICAgICBw
bV9ydW50aW1lX3B1dF9ub2lkbGUoJnBkZXYtPmRldik7CiAgfQoKVGhhbmtzLApKaWUKCj4gVGhh
bmtzLAo+IEppZQo+IAo+Pgo+PiBUaGUgaWRlYSBpcyB0byBmaXJzdCByZXN1bWUgdGhlIGRldmlj
ZSB3aXRoIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSwgdGhlbgo+PiBwZXJmb3JtIHRoZSByZW1vdmUg
KHdoaWNoIGlzIHNhZmUgaWYgdGhleSBuZWVkIHRvIGFjY2VzcyBvciBjbGVhbiB1cAo+PiBoYXJk
d2FyZSBzdGF0ZSksIGFuZCBmaW5hbGx5IGNsZWFuIHVwIHRoZSBydW50aW1lIFBNIHN0YXRlcy4g
SSBtYWlubHkKPj4gcmVmZXJyZWQgdG8gZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jLgo+Pgo+
PiBUaGFua3MsCj4+IExlbwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
