Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LopCmXLu2leoQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 11:09:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B47032C9413
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 11:09:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53460C87ED3;
	Thu, 19 Mar 2026 10:09:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3D7BC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 10:09:38 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62J742UA2666169
 for <linux-stm32@st-md-mailman.stormreply.com>; Thu, 19 Mar 2026 10:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=; b=hcTKvR+0CZSQmyRH
 E5MJdOoMORZkt8RutJZE9N3EduJrPpl9OgX1etw5ZQk/WQijVcRYv5QPM++nNaja
 lGnrh32GYZRFt8Fh5h9T3mZfabO0DB4ahegsnRE9ptkh0nJGOPQRTHDckCU1dBsq
 nwk5RuuErkoixgJ9h/WikNvamxST4pIhZcpRxtNfUyIRcdketVqM2K6e4qAKsr8x
 tnozskWT9bsS8fNuHhppJgo/djWubalN55/voA73pqeehqNqVBHHnhXG1p9qMASl
 4a9BPmFeZVEd7CW5myQjRmXB1PECK5h7LCPYj2wgj2jDMMGc/2FjzYdX6r0VSpEv
 p8cIUg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj549bk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 10:09:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50947db2e97so6178161cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773914977; x=1774519777;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
 b=BGnczkX4HMgmGYdHFGbwcLBGC4wpvI26wFL9sYUXmmfPvwGF/PqcMHHOH9v2H2mtCM
 BRc9ypb+G4n/27U/Vn0zJGVf3YYH2s4BTuA8kkjU0oJF5q+G1eWrt9pa+0GoxSI64K1B
 W3IUX6VMGl38LyfkIInfDGQc6i8v9aTL78+idYj38A2SjCCMYIW0ktGlDl+ylKNFaepc
 +gKy/b9eRwCok04XHGXVjBvlxk1jEx9XGXpglOdbRLn4d7+H3uRUO8Z3FnW1ewqWmruK
 WQa/tFIYT7Rn8j9lBa/A6iJNDlWJYKjI+01HXxVmjFVkOKPMLsBkrueKMqLzlueeNhFT
 q5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773914977; x=1774519777;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N8mxSfzXNyJfRBoaEQdvz7W4Ia4Ks0F5EAbj13/rqrk=;
 b=rY7+WCbrlLCU7buqMpV+Ov7RjYwkq3NhUjLKLf48TXpIu+h//RhYkfp+TKW3HbCyVZ
 kNuy4w2wzlGnrzl1qnqJHFCUMvE0o9KgJM0SbUABIyumGmhcJSa61rES0sY16f5g0qSU
 JItbkFvxYHP/+gYv2B7P9ST82vimCwLERlET7NKqdfN4TAbV9aIWL5MawK58G+NM9fE3
 32PFRYhFzuIIjELQBwj+2Dot/1kn3Ye8KFgc/IqlbZdgmfn4JvWxM9pv+FoD+BD0YaJ8
 IuK565b9QgaKzmE2aLC6aHrQK7MlxIZqbfn6kjDa1e49hYsjUJBt6nkoVc8Xu7lRpbpZ
 jEsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt1+rDaMpH3NWjs4qpgx4tajB3PqOEeVVkjIAftUo3mzHm0xmjcr28Q6mRvulpUTpWSWTgZBA+qI8vCA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzmujXAY4elBVfUDDMPHW+YdalLs8B5iKBZp2nMl2fKug42ICme
 aeUia6C0VYiV2R+/JfA+Q68SZUAX7cvIYYctR7fFfuCG1Owz5sMuh4hhmL8ODlFbQP/YEXPNxNN
 KvzNO4ORAZDKMq46XwxkCEI7GtjEp9dAa4v92FV6l16IGIWQCWtUkhzh3wfYWr+Ppf2anJOhDaT
 LRt30qaCM=
X-Gm-Gg: ATEYQzw+xFY+e7u4MUPsP04HBAFkxaIVRvsXj/qgjKb0+NSg0ma7IF5a/B8DLbCNE6m
 ueuTpXl6A7ChbXwKgXYYqp5Az3i85+j2Ybso/uoUr6AcOcBvdMZcUNtLKt98H/VPDE47IJoEIFf
 WRE4AWlhopGLGzT8AKqs4RIo7NKj4b2zdd3TwGgMcbMZj+HwX0jgAZRWJAGMxc89zsC0SM3Jodw
 HNTgDGxxp9fA1cyD/cdrqLBxHClRCbZnqwpvLzICXsaxsHXsP19G9LATDObs9r0QJJcaqebRM6S
 7DKqCViJrpc+HmHjEzt4EsylEkw1dOoXkajtorhVgUoxHgiEI2s9uQ7+TH1THu7INgVXktoLNnm
 o0QzfT+OQGBxzaOPETvhtGHQTWI0ySmlw2258O36nbSSclh9tmb1daNaBrgBjJAs8LvkHP7PTDf
 b9QcY=
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id
 d75a77b69052e-50b14866da5mr65080901cf.5.1773914976674; 
 Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:509:38b0:c44b with SMTP id
 d75a77b69052e-50b14866da5mr65080601cf.5.1773914976161; 
 Thu, 19 Mar 2026 03:09:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6688b67aacesm190582a12.11.2026.03.19.03.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 03:09:35 -0700 (PDT)
Message-ID: <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 11:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com> <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk> <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA4MCBTYWx0ZWRfX3oEjs6xkCI3k
 CHTh3gUiQDh/nZnfJkmexD4m07AMZw27gSoxlw7J46NI0h6Z4FQfLvtNfYPLdjbW3kPryk9w+td
 7lKe2EVY6Bbc+/RdVgY1gBS8098tYXxZPLBA8xcMQ9xfhbfxLfSSXOU1hjVPKx9SC6spsFSKb0y
 kD4WJiN9LcoASlFrLwtkTuyjRKJWMLVLctcffSV4PBe9hFaNnjSdesLmPlHwHiJ3LpaRKpwUOJp
 aV+FzoAh4AifUElvnWm2RoI7kI7g9tUcPGNrQZmNt7XlegH2VUDFnKKBWhPtQgrXtS5KxSVIMCH
 REaKDx8rqa+KzQdU6elkxqglOOY0IWJd6Sez4k/9BfcqKglO13OJLIJNWMjCa/LQ/9bGt711Dq8
 xCzDQOGDcOnIQhoHUeQwVoRagXPY3K9jLHKq4cLQHCsz6OiNV64coVVIc+JboAjZLvQe9r+uX9U
 At0k1WRBgZFMjKwNc7w==
X-Proofpoint-ORIG-GUID: vcf0i418KVb4qtmGMc_naWaRuDgVF8Eg
X-Proofpoint-GUID: vcf0i418KVb4qtmGMc_naWaRuDgVF8Eg
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbcb61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gtcge7hCmZdjPOC0CCEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190080
Cc: Andrew Lunn <andrew@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[qualcomm.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:-,oss.qualcomm.com:-];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:mohd.anwar@oss.qualcomm.com,m:andrew@lunn.ch,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.822];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: B47032C9413
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
>> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
>>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
>>
>> Please look into this first - with the MDIO bus operating at
>> who-knows-what frequency, this could make reading from the PHY
>> unreliable.
> 
> My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> which means we don't know the rate of the CSR clock.
> 
> From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> struct clk_branch makes no mention of any clock rate, nor does it
> have any parent. From what I can see, neither of these drivers
> specify any rates for any of their clocks, which likely means that
> clk_get_rate() will be zero for all of them.
> 
> Sadly, when I designed the clk API, I didn't think that people would
> be stupid enough not to implement the API properly, more fool me.
> 
> Under the old code, we would've used STMMAC_CSR_20_35M, which means
> we're assuming that the CSR clock is between 20 and 35MHz, even
> though the value is zero. Is that the case? If it's higher than
> 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> specification, which can make PHY access unrealible.
> 
> In any case, please fix your clock drivers.

I'm not 100% sure the currently-passed AXI clock is what we want
there and the docs aren't super helpful.. is there a synopsys-name
for it? What rates would you expect it to run at?

Konrad
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
